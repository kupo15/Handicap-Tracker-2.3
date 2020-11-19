function draw_playing() {
	// header
	draw_screen_header(headerType.back,headerType.none,"Playing Course");

	// draw course playing
	var xx = 10;
	var yy = 100;
	var ww = app_width;
	var sep = 100;
	var height = 50;

	if play_course_id == noone
	var course_name = "select course";
	else
	var course_name = play_course_id[| course_data.name];

	if string_length(course_name) > 16
	var course_height = 40;
	else 
	var course_height = height;
	draw_text_height(xx,yy," Active Course",height*0.6,fn_italic); // draw course name label
	draw_text_height(xx,yy+35,course_name,course_height); // draw course name

	// draw tee info
	 if play_course_teebox != noone
		{
		var tee_pointer_MAP = play_course_id[| 1];
		var tee_color = play_course_teebox;
		var tee_data_pointer = tee_pointer_MAP[? tee_color];
		var course_yardage = tee_data_pointer[| tee_data.yardage];
		var course_slope = tee_data_pointer[| tee_data.slope];
		var course_rating = tee_data_pointer[| tee_data.rating];
		var course_par = tee_data_pointer[| tee_data.par];
	
		var tee_str = tee_color+" "+course_yardage+" yds ("+course_slope+" / "+course_rating+")";
		draw_tee_marker(xx+15,yy+40+10+(1*sep),8,play_course_teebox_index); // draw tee marker

		if is_nan(ghin_index)
			{
			var _handicap = "N/A";
			var _handicap_under = "";
			var _handicap_over = "";
			var max_under = "";
			var max_over = "";
			}
		else
			{
			var _handicap = scr_course_handicap(ghin_index,course_slope,course_rating,course_par);
			var _handicap_under = "1-"+string(abs((_handicap) mod 18));
			if _handicap mod 18 == 0
			var _handicap_under = "1-18";

			var _handicap_over = string((abs(_handicap) mod 18)+1)+"-18";
			
			var max_under = 2+ceil(_handicap/18);
			var max_over = 2+floor(_handicap/18);
			}
		
		var under_str = play_course_handicap_dec;
		
		var over_str = play_course_handicap_inc;
		if over_str == noone
		over_str = "Free Round";
		}
	else
		{
		var tee_str = "";
		var _handicap = "";
		var _handicap_under = "---";
		var _handicap_over = "-";
		var max_under = "";
		var max_over = "";
		var course_par = "";
		var under_str = "";
		var over_str = "";
		}
		
	// draw tee info
	draw_text_height(xx,yy-10+(1*sep)," Select Tee",height*0.6,fn_italic); // draw tee marker label label
	draw_text_height(xx+35,yy+40-5+(1*sep),tee_str,36); // draw slope/rating
	
	// if clicked on course
	if click_region_released(0,yy-10,ww,sep,true,navbar.main)
		{
		popup_coursebar();
		mouse_clear(mb_left);
		}
		
	// if clicked on tee
	if play_course_teebox != noone && click_region_released(0,yy-10+(1*sep),ww,sep,true,navbar.main)
		{
		submenu = navbar.teebar;
		mouse_clear(mb_left);
		}
		
	// keyboard entry
	if kvActive
	switch textboxIndex
	    {
	    case 0: play_course_score = string_convert_real(keyboard_string,3); break; // scr_input_text(3); break;
	    case 1: play_course_esc = string_convert_real(keyboard_string,2); break; // scr_input_text(2); break;
	    }
		
	// clicked enter
	if virtual_keyboard_enter
	switch textboxIndex
		{
		case 0: textboxIndex = 1; 
				keyboard_string = play_course_esc;
				break;
			
		case 1: vk_hide(); break;
		}
	
	// draw scores
	var xx = 20;
	var ww = 225;
	var height = 60;
	
	draw_set_halign(fa_left);
	draw_textbox(xx,yy+20+(2*sep),ww,80);
	draw_text_height(xx,yy-10+(2*sep),"Gross Score",height*0.6,fn_italic);
//	draw_text_height_entry(xx+60,yy-5+40+(2*sep),play_course_score,height,noone,0,height);
	draw_text_height_ext_cursor(xx+60,yy-5+40+(2*sep),play_course_score,play_course_score,0,-1,ww,height,0);
	
	// if clicked on score
	if click_region_released(xx,yy+20+(2*sep),ww,80,true,navbar.main)
	click_textbox_set(play_course_score,0,kbv_type_numbers);

	var xx = 250;
	var ww = 225;

	draw_textbox(xx,yy+20+(2*sep),ww,80);
	draw_text_height(xx,yy-10+(2*sep),"Strokes Reduced",height*0.6,fn_italic);
	if play_course_esc == ""
		{
		draw_set_color(c_gray);
		draw_text_height_entry(xx+60,yy-5+40+(2*sep),"0",height,noone,1,height,fn_italic); // draw default "0"
		draw_set_color(c_black);
		}
	else
	draw_text_height_ext_cursor(xx+30,yy-5+40+(2*sep),play_course_esc,play_course_esc,0,-1,ww,height,1);
	// draw_text_height_entry(xx+30,yy-5+40+(2*sep),play_course_esc,height,noone,1,height);

	// clicked on Strokes Reduced
	if click_region_released(xx,yy+20+(2*sep),ww,80,true,navbar.main)
	click_textbox_set(play_course_esc,1,kbv_type_numbers);
		
	/*// Draw Score
	var ww = 300;
	var hh = 95;
	var xx = 0;
	var col = c_white;
	
	draw_textbox(xx,yy-10+(2*sep),ww,sep);	
	draw_text_height(xx+20,yy-10+(2*sep),"Enter Score",height*0.6,fn_italic);
	draw_text_height_entry(xx+40,yy-5+40+(2*sep),string(play_course_score)+"",height,noone,0,height);
	
	// clicked on score
	if click_region_released(0,yy-10+(2*sep),ww,sep,true,navbar.main)
		{
		submenu = navbar.scorebar;
		scorebar_yoff = 1;
		}*/
	
	// draw course info
	var xx = 10;
	var yy = 100;
	
	draw_text_height(xx+10,yy+115+(2*sep),"Course Handicap: "+string(_handicap),40);
	draw_text_height(xx+360,yy+115+(2*sep),"Par "+string(course_par),40); // draw par
	
	draw_text_height(xx+10,yy+170+(2*sep),"Max Strokes",30,fn_italic); // draw max score
	draw_text_height(xx+10,yy+170+30+(2*sep),"HCP Holes "+string(_handicap_under),38); // draw HCP holes
	draw_text_height(xx+10+270,yy+170+30+(2*sep),max_score_text(max_under),38,fn_italic); // draw max score
	
	if is_real(_handicap) && ((_handicap mod 18) != 0)
		{
		draw_text_height(xx+10,yy+170+30+40+(2*sep),"HCP Holes "+string(_handicap_over),38); // draw HCP holes
		draw_text_height(xx+10+270,yy+170+30+40+(2*sep),max_score_text(max_over),38,fn_italic); // draw max score
		}
	
	
	// predict score to affect handicap
	draw_set_halign(fa_center);
	
	var yoff = 100;
	draw_text_height(125,yy-15+100+(3*sep)+yoff,"To Improve Index",25);
	draw_text_height(125,yy+110+(3*sep)+yoff,"Score",40);
	draw_text_height(125,yy+110+(3.45*sep)+yoff,under_str,55);
	draw_text_height(125,yy+110+(4*sep)+yoff,"or Better",40);

	draw_text_height(390,yy-15+100+(3*sep)+yoff,"To Worsen Index",25);
	draw_text_height(390,yy+110+(3*sep)+yoff,"Score",40);
	draw_text_height(390,yy+110+(3.45*sep)+yoff,over_str,55);
	draw_text_height(390,yy+110+(4*sep)+yoff,"or Worse",40);
	draw_set_halign(fa_left);
		
#region clear playing
	// clear
	var ww = 180;
	var hh = 95;
	var xx = 1;
	var yy = room_height-(nav_height*nav_sca_off)-hh;
	var col = c_white;

	draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	draw_set_halign(fa_center);
	draw_text_height(xx+(ww/2),yy+20,"Clear",55);
	
	// clicked clear course
	if click_region_released(xx,yy,ww,hh,true,navbar.main) // && submit
		{
		scr_playing_clear();
		app_save;
		}
#endregion

	// submit round
	var submit = (play_course_id != noone) && (play_course_teebox != noone) && (play_course_score != "");
	var ww = 360;
	var hh = 95;
	var xx = 180;
	var yy = room_height-(nav_height*nav_sca_off)-hh;
	var col = c_white;

	draw_set_alpha(0.5+(submit*0.5));
	draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	draw_set_halign(fa_center);
	draw_text_height(xx+(ww/2),yy+20,"Submit Round",55);
	draw_set_alpha(1);

	// clicked submit round
	if click_region_released(xx,yy,ww,hh,true,navbar.main) && submit
		{	
		// create score
		if play_course_esc == ""
		play_course_esc = 0;
	
		var net_score = real(play_course_score)-real(play_course_esc);
		var date = date_create_datetime(current_year,current_month,current_day,1,1,1); 
		scr_score_add_index(course_name,play_course_teebox,play_course_score,date,play_course_esc);
	
		// save data
		ds_list_sort_nested(master_score_list,score_data.date,false); // date sort
		scr_handicap_calculate();

		app_save;
	
		// reset playing course
		play_course_id = noone;
		play_course_teebox = noone;
		play_course_yardage = noone;
		play_course_slope = noone;
		play_course_rating = noone;
		play_course_par = noone;
		play_course_score = "";
		play_course_esc = "";
	
		submenu = navbar.main;
		textboxIndex = noone;
		screen_change(screen.home);
		index = 0;
		}
	
	// enter score button
	/*var ww = 540;
	var hh = 95;
	var xx = 0;
	var yy = room_height-(nav_height*nav_sca_off)-hh;
	var col = c_white;

	draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	draw_set_halign(fa_center);
	draw_text_height(540/2,yy+15,"Enter Score",70);

	// clicked Enter Score
	if click_region_released(0,yy,ww,hh,true,navbar.main)
		{
		submenu = navbar.scorebar;
		scorebar_yoff = 1;
		}*/

	if androidBack
	    {
		if kvActive
		vk_hide();
		else if submenu >= 0
	    submenu = navbar.main;
		else
	    screen_goto_prev();
	    }


}
