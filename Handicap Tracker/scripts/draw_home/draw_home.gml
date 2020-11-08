function draw_home() {

	// draw the 3 bars
	draw_screen_header(headerType.bars,headerType.none,"Home");
	
	// draw Handicap Index
	var xx = 540/2;
	var yy = 60;
	var height = 70;

	if is_nan(ghin_index)
	var str = "N/A";
	else
	var str = string_format(ghin_index,1,1);

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


	/*
	// draw recent rounds
	var rows = 3;
	var sep = 110;
	var hh = rows*sep;
	var xx = 0;
	var yy = room_height-hh-125;
	var height = 40;
	var list_size = ds_list_size(master_score_list);

	for(var i=0;i<rows;i++)
	    {
		var slot = list_size-rows+i;
		var score_pointer = master_score_list[| slot];
	    var course_name = score_pointer[| score_data.course];
	    var course_tee = ds_list_find_index(teebox_list,score_pointer[| score_data.tee]);
	    var course_yardage = score_pointer[| score_data.yardage];
	    var course_slope = score_pointer[| score_data.slope];
	    var course_rating = score_pointer[| score_data.rating];
	    var _score = score_pointer[| score_data.score_];
	    var date = score_pointer[| score_data.date];
		var month = date_get_month(date);
		var day = date_get_day(date);
		var year = date_get_year(date);
		var date_string = string(month)+"/"+string(day)+"/"+string(year);
		var off_pos = i; // slot-score_list_offset;

		var course_str = string_abbreviate(course_name,490,60,"...");
	    draw_text_height(xx,yy+15+(off_pos*sep),course_str,height); // draw course name
		draw_text_height(xx+425,yy+15+(off_pos*sep),_score,60); // draw score shot
	
		var str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
		draw_tee_marker(xx+15,yy+90+(off_pos*sep),8,course_tee); // draw tee marker
	    draw_text_height(xx+35,yy+75+(off_pos*sep),str,36); // draw slope/rating
	    draw_text_height(xx+360,yy+75+(off_pos*sep),date_string,36); // draw date played

	    draw_line_pixel(25,yy+((1+off_pos)*sep),room_width,1,c_black,0.2); // draw row lines
		}



/* end draw_home */
}
