/*
function draw_playing_score_enter() {
	
	if submenu != navbar.scorebar
	exit;

	var course_name = active_course_struct[| textboxEntry.courseName]

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
		
	// draw dialogue box
	var box_xx = -1;
	var box_yy = 0;
	var box_ww = room_width;
	var box_hh = 450;
	var col = c_black;

	draw_set_alpha(0.5);
	draw_rectangle_color(0,0,room_width,room_height,col,col,col,col,false);
	draw_set_alpha(1);

	// draw background
	var col = c_white;
	draw_roundrect_color(box_xx,box_yy,box_xx+box_ww,box_yy+box_hh+500,col,col,false);
	
	draw_set_halign(fa_center);
	draw_text_height(box_xx+(box_ww*0.5),box_yy+5,"Enter Score",70); // draw header
		
	// draw scores
	var xx = 20;
	var yy = box_yy+125;
	var sep = 100;
	var ww = 225;
	var height = 60;
	
	draw_textbox(xx,yy+40,ww,80);
	draw_set_halign(fa_left);
	
	draw_text_height(xx,yy,"Gross Score",height*0.6,fn_italic);
	// draw_text_height_entry(xx+60,yy+60,play_course_score,height,noone,0,height);
	draw_text_height_ext_cursor(xx+60,yy+60,play_course_score,play_course_score,0,-1,ww,height,0);

	// if clicked on score
	if click_region_released(xx,yy+30,ww,sep,true,navbar.scorebar)
	click_textbox_set(play_course_score,0,kbv_type_numbers);

	var xx = 250;
	var ww = 225;
	var height = 60;

	draw_textbox(xx,yy+40,ww,80);
	draw_text_height(xx,yy,"Strokes Reduced",height*0.6,fn_italic);
	if play_course_esc == ""
		{
		draw_set_color(c_gray);
		draw_text_height_entry(xx+60,yy+60,"0",height,noone,1,height,fn_italic); // draw default "0"
		draw_set_color(c_black);
		}
	else
	draw_text_height_entry(xx+30,yy+50,play_course_esc,height,noone,1,height);

	if click_region_released(xx,yy+30,ww,sep,true,navbar.scorebar)
	click_textbox_set(play_course_esc,1,kbv_type_numbers);
		
	// submit round
	// var submit = (active_course_struct != undefined) && (play_course_teebox != noone) && (play_course_score != "");
	var ww = app_width;
	var hh = 95;
	var xx = 0;
	var yy = box_yy+box_hh-hh-30;
	var col = c_white;

	draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	draw_set_halign(fa_center);
	draw_text_height(app_width/2,yy+15,"Enter Score",70);

	// clicked submit
	if click_region_released(0,yy,ww,hh,true,navbar.scorebar) //  && submit
		{	
		vk_hide();
		submenu = navbar.main;
		textboxIndex = noone;
		}
		
		/*
	// clicked submit
	if click_region_released(0,yy,ww,hh,true,navbar.scorebar) && submit
		{	
		// create score
		if play_course_esc == ""
		play_course_esc = 0;
	
		var net_score = real(play_course_score)-real(play_course_esc);
		var date = date_create_datetime(current_year,current_month,current_day,1,1,1); 
		scr_score_add_index(course_name,play_course_teebox,play_course_score,date,play_course_esc);
	
		// save data
		ds_list_sort_nested(master_score_list,textboxEntry.date,false); // date sort
		scr_handicap_calculate();

		app_save;
	
		// reset playing course
		active_course_struct = undefined;
		play_course_teebox = noone;
		play_course_yardage = noone;
		play_course_slope = noone;
		play_course_rating = noone;
		play_course_par = noone;
		play_course_score = "";
		play_course_esc = "";
	
		submenu = navbar.main;
		textboxIndex = noone;
		screen_change(screen.home,true);
		index = 0;
		}
}