function draw_score_add() {

	// header
	var str = "Add Score";
	if screenIndex == screen.edit_score
	var str = "Edit Score";

	draw_screen_header(headerType.back,headerType.none,str);
	
	var score_pointer = master_score_list[| index];

	if kvActive
	switch textboxIndex
	    {
	    case 0: temp_score = string_convert_real(keyboard_string,3); break; // scr_input_text(3); break;
	    case 1: temp_strokes = string_convert_real(keyboard_string,2); break; // scr_input_text(2); break;
	    }

	var xx = 20;
	var yy = 120;
	var ww = 250;
	var sep = 130;
	var height = 70;
					
	var course_name = score_pointer[| score_data.course];
	var course_tee = temp_score_tee; // temp_course_tee; // score_pointer[| score_data.tee];
	var course_yardage = temp_score_yardage; // temp_course_yardage; // score_pointer[| score_data.yardage];
	var course_slope = temp_score_slope; // temp_course_slope; // score_pointer[| score_data.slope];
	var course_rating = temp_score_rating; // temp_course_rating; // score_pointer[| score_data.rating];
	var date = score_pointer[| score_data.date];
	var month = funct_convert_date(date_get_month(date)-1,false,-1,true);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_str = string(month)+" "+string(day)+", "+string(year);

	var course_height = text_reduce(course_name,500,height);
	draw_textbox(0,yy+40,room_width,80);
	draw_text_height(xx,yy,"Course",height*0.6,fn_italic); // draw course name label
	draw_text_height(xx,yy+50,course_name,course_height); // draw course name

	draw_textbox(0,yy+40+(1*sep),room_width,80);
	draw_text_height(xx,yy+(1*sep),"Tee",height*0.6,fn_italic); // draw course tee markers label
	draw_text_height(xx,yy+55+(1*sep),string(course_tee)+" "+string(course_yardage)+" yds ("+string(course_slope)+" / "+string(course_rating)+")",height*0.7); // draw course tee markers

	draw_textbox(0,yy+40+(2*sep),250,80);
	draw_text_height(xx+15,yy+5+(2*sep),"Gross Score",height*0.5,fn_italic); // draw score label
	// draw_text_height_entry(xx+50,yy+45+(2*sep),temp_score,height,noone,0,height); // draw score
	draw_text_height_ext_cursor(xx+50,yy+45+(2*sep),temp_score,temp_score,0,-1,ww,height,0); // draw score

	draw_textbox(300,yy+40+(2*sep),250,80);
	draw_text_height(xx+270,yy+5+(2*sep),"Strokes Reduced",height*0.5,fn_italic); // draw score label

	if temp_strokes == ""
		{
		draw_set_color(c_gray);
		draw_text_height_entry(xx+50+300,yy+45+(2*sep),"0",height,noone,1,height*0.9,fn_italic); // draw default "0"
		draw_set_color(c_black);
		}
	else
	draw_text_height_ext_cursor(xx+50+300,yy+45+(2*sep),temp_strokes,temp_strokes,0,-1,250,height,1); // draw strokes
	// draw_text_height_entry(xx+50+300,yy+45+(2*sep),temp_strokes,height,noone,1,height); // draw strokes

	draw_set_halign(fa_left);
	draw_textbox(0,yy+40+(4*sep),room_width,80);
	draw_text_height(xx,yy+(4*sep),"Date Played",height*0.6,fn_italic); // draw date label
	draw_text_height(xx,yy+45+(4*sep),date_str,height); // draw date

	var ww = app_width;
	for(var i=0;i<2;i++)
	if click_region_released(0,yy+(i*sep),ww,sep,true,navbar.hidden)
	    {
		searched_name = "";
	
		switch i
			{
		    case 0: mouse_clear(mb_left);
			case 1: submenu = i; break;
			}
	    }

	var ww = 250;
	for(var i=0;i<2;i++)
	if click_region_released(0+(i*300),yy+(2*sep),ww,sep,true,navbar.hidden)
	switch i
		{
		// click on score
		case 0: click_textbox_set(temp_score,0,kbv_type_numbers); break;
				
		// click on strokes
		case 1: click_textbox_set(temp_strokes,1,kbv_type_numbers); break;
		}

	// clicked enter
	if virtual_keyboard_enter
	switch textboxIndex
		{
		case 0: textboxIndex ++;
				keyboard_string = temp_strokes;
				break;
			
		case 1: vk_hide(); break;
		}
	
	// clicked on date
	var ww = room_width;
	if click_region_released(0,yy+(4*sep),ww,sep,true,navbar.hidden)
		{
		date_pointer = score_pointer;
		scr_set_date_offsets(score_pointer[| score_data.date]);
		prev_screen = screenIndex;
		screenIndex = screen.edit_date;
		}
		
	// delete score
	if screenIndex == screen.edit_score
		{
		var ww = 170;
		var hh = 95;
		var xx = 5;
		var yy = room_height-hh-2;
		var col = c_red;
	
		draw_set_alpha(0.3);
		draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
		draw_set_alpha(1);

		draw_sprite_ext(ico_trash2,1,xx+55,yy+10,0.8,0.8,0,c_white,1); // draw trash icon
	
		// clicked trash icon
		if click_region_released(xx,yy,ww,hh,true,navbar.hidden)
			{
			ds_list_delete(master_score_list,index); // delete score
			json_save(save_data);

			submenu = navbar.main;
	        screenIndex = screen.score_list;
	        index = 0;
			exit;
			}
		}

    
	// Create
	var submit = (score_pointer[| score_data.course] != "") && (temp_score != "") && (temp_score_tee != "");
	
	var ww = 350;
	var hh = 95;
	var xx = 185;
	var yy = room_height-hh-2;

	var str = "Update";
	if screenIndex == screen.add_score
	var str = "Create";
	
	// draw Create/Update box
	draw_set_alpha(0.5+(0.5*submit));
	draw_roundrect(xx,yy,xx+ww,yy+hh,true);
	
	draw_set_halign(fa_center);
	draw_text_height(xx+(ww/2),yy+20,str,70);
	draw_set_alpha(1);

	// clicked submit
	if click_region_released(xx,yy,ww,sep,true,navbar.hidden) && submit
		{
		if temp_strokes == ""
		temp_strokes = "0";
		
		score_pointer[| score_data.score_] = temp_score;	
		score_pointer[| score_data.strokes] = temp_strokes;	
		score_pointer[| score_data.tee] = temp_score_tee; // temp_course_tee;
		score_pointer[| score_data.yardage] = temp_score_yardage; // temp_course_yardage;
		score_pointer[| score_data.slope] = temp_score_slope; // temp_course_slope;
		score_pointer[| score_data.rating] = temp_score_rating; // temp_course_rating;
		score_pointer[| score_data.par] = temp_score_par; // temp_course_par;
		
		submenu = navbar.main;
		textboxIndex = noone;
		screenIndex = screen.score_list;
		index = 0;
		score_list_offset = 0;
		score_list_offset_start = 0;
	
		scr_handicap_calculate();
		ds_list_sort_nested(master_score_list,score_data.date,false); // date sort
		json_save(save_data);
		}
	
	if androidBack
	    {
	    if submenu >= 0
	    submenu = navbar.hidden;
	    else if !kvActive
	        {
			// delete score unsaved
			if screenIndex == screen.add_score
			ds_list_delete(master_score_list,index);
		
			course_id = noone;
			submenu = navbar.main;
			textboxIndex = noone;
			screenIndex = screen.score_list;
			index = 0;
	        }
	    }




		/*
	draw_set_halign(fa_center);

	draw_text_height(xx,yy+(3*sep),"Yardage",height*0.6,fn_italic); // draw course yardage label
	draw_text_height(xx,yy+40+(3*sep),course_yardage,height); // draw course yardage

	draw_set_halign(fa_center);
	draw_text_height(390,yy+(3*sep),"Slope/Rating",height*0.6,fn_italic); // draw course slope label
	draw_text_height(390,yy+40+(3*sep),string(course_slope)+" / "+string(course_rating),height); // draw course slope*/

	/*
	// holes played
	var xsep = room_width*0.33;
	var xoff = (room_width/2)-xsep;
	for(var i=0;i<3;i++)
		{
		switch i
			{
			case 0: var str = "18 Holes"; break;
			case 1: var str = "Front 9"; break;
			case 2: var str = "Back 9"; break;
			}
	
		draw_textbox(xx+(i*xsep),yy+30+(3*sep),xsep*0.9,75,true);
		draw_text_height(xoff+(i*xsep),yy+40+(3*sep),str,45);
	
		click_region_released(xx+(i*xsep),yy+(3*sep),xsep*0.9,sep,true,navbar.hidden);
		}*/



}
