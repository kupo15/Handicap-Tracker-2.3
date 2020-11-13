function draw_home() {

	// draw the 3 bars
	draw_screen_header(headerType.bars,headerType.none,"Home");
	
	// draw Handicap Index
	var xx = app_width/2;
	var yy = 60;
	var height = 70;

	if is_nan(ghin_index)
	var str = "N/A";
	else
	var str = string_format(ghin_index,1,1);
	var str = "0";

	draw_set_halign(fa_center);
	draw_text_height(xx,yy,"Index",height);
	draw_text_height(xx,yy+80,str,height*2);
	draw_set_halign(fa_left);
	
	// var half = 70;
	// draw_rectangle(xx-half,yy+210,xx+half,yy+210+10,true);

	// clicked on index
	if click_region_released(165,150,235,150,true,navbar.main)
		{
		scr_trend_set();
		exit;
		}

	// draw rounds played
	var xx = 20;
	var yy = 350;
	var height = 60;

	draw_text_height(xx,yy,"Rounds Played: "+string(rounds_played),height);

	// draw round falling off
	draw_falling_off(10,740);

	
	/*
	// draw course playing
	var xx = 20;
	var yy = 475;
	var ww = 540;
	var sep = 130;
	var height = 60;

	if play_course_id == noone
	var course_name = "select course";
	else
	var course_name = play_course_id[| course_data.name];

	if string_length(course_name) > 16
	var course_height = 40;
	else 
	var course_height = height;
	draw_text_height(xx,yy," Active Course",height*0.6,fn_italic); // draw course name label
	draw_text_height(xx,yy+40,course_name,course_height); // draw course name

	// draw tee info
	if play_course_teebox != noone
		{
		var tee_pointer_MAP = play_course_id[| 1];
		var tee_color = play_course_teebox;
		var tee_data_pointer = tee_pointer_MAP[? tee_color];
		var course_yardage = tee_data_pointer[| 0];
		var course_slope = tee_data_pointer[| 1];
		var course_rating = tee_data_pointer[| 2];
	
		var str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
		draw_tee_marker(xx+15,yy+100+(0*sep),8,play_course_teebox_index); // draw tee marker
		draw_text_height(xx+35,yy+85+(0*sep),str,36); // draw slope/rating
	
		if is_nan(ghin_index)
		var _handicap = "N/A";
		else
		var _handicap = string_format(real(ghin_index)*real(course_slope)/113,2,1);
	 
		draw_text_height(xx+15,yy+(1*sep),"Course Handicap: "+string(_handicap),40);
		}

	if click_region_released(0,yy-10,ww,sep,true,navbar.main)
		{
		screenIndex = screen.playing;
		mouse_clear(mb_left);
		}

	if androidBack
	    {
	    if submenu >= 0
	    submenu = navbar.main;
	    }
*/
}
