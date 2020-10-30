
function draw_teebox_list() {

	var alph = (teebar_yoff_start/1);
	draw_set_alpha(alph);

	var rows = ds_list_size(teebox_list);
	var sep = 65;
	var ww = 540;
	var hh = rows*sep;
	var xx = 0;
	var yy = 960-(hh*teebar_yoff_start);

	var col = make_colour_rgb(220,220,255);

	draw_set_halign(fa_left);
	draw_roundrect_colour(-1,yy,xx+ww,yy+hh,col,col,false);
	draw_roundrect(-1,yy,xx+ww,yy+hh,true);

	var height = 65;
	for(var i=0;i<rows;i++)
	    {
		var has_data = teebox_filled[| i];
		
		if has_data && course_id != noone
			{
			var tee_pointer_MAP = course_id[| 1];
			var tee_color = teebox_list[| i];
			var tee_data_pointer = tee_pointer_MAP[? tee_color];
			var course_yardage = tee_data_pointer[| tee_data.yardage];
			var course_slope = tee_data_pointer[| tee_data.slope];
			var course_rating = tee_data_pointer[| tee_data.rating];
			var course_par = tee_data_pointer[| tee_data.par];
	
			var teebox_str = course_yardage+" yds ("+course_slope+"/"+course_rating+")";
			}
		else 
		var teebox_str = "";
		
	    var str = teebox_list[| i]+" "+teebox_str;
	    draw_text_height(xx+60,yy+10+(i*sep),str,height*0.7); // draw tee
		draw_tee_marker(xx+25,yy+30+(i*sep),10,i); // draw teebox marker
	
	
		if !has_data //&& screen_index == screen.edit_score
			{
			var col = c_gray;
		
			draw_set_alpha(0.4);
			draw_rectangle_color(0,yy+(i*sep),ww,yy+sep+(i*sep),col,col,col,col,false);
			draw_set_alpha(1);
			}

    
		// clicked on a tee marker
	    if click_region_released(xx,yy+(i*sep),ww,sep,true,navbar.teebar)
	        {	
			teebox_index = i;
	        submenu = navbar.hidden;
		
			var tee = teebox_list[| teebox_index]; // tee color

			// play course
			if screen_index == screen.playing
				{
				if has_data
					{
					play_course_teebox_index = i;

					var tee_pointer = course_id[| 1]; // tee marker MAP
					var tee_data_pointer = tee_pointer[? tee];
					var course_yardage = tee_data_pointer[| tee_data.yardage];
					var course_slope = tee_data_pointer[| tee_data.slope];
					var course_rating = tee_data_pointer[| tee_data.rating];
					var course_par = tee_data_pointer[| tee_data.par];
			
					// set play course variables
					play_course_teebox = tee;
					play_course_yardage = course_yardage;
					play_course_slope = course_slope;
					play_course_rating = course_rating;
					play_course_par = course_par;
			
					submenu = navbar.main;

					scr_handicap_predict(false);
					scr_handicap_predict(true);
				
					json_save(save_data);
					}
				else // go to add tee data
					{
					temp_course_yardage = "";
					temp_course_slope = "";
					temp_course_rating = "";
					temp_course_par = "";
	
					textbox_index = 1;
					course_id = play_course_id;
					prev_screen = screen_index;
					screen_index = screen.edit_course;
					submenu = navbar.hidden;
					}
			
				}
			// add or update score
			else if (screen_index == screen.add_score) || (screen_index == screen.edit_score) || (screen_index == screen.edit_course) || (screen_index == screen.add_course)
				{				
				if has_data
					{
					var tee_pointer = course_id[| 1]; // tee marker MAP
					var tee_data_pointer = tee_pointer[? tee];
					var course_yardage = tee_data_pointer[| tee_data.yardage];
					var course_slope = tee_data_pointer[| tee_data.slope];
					var course_rating = tee_data_pointer[| tee_data.rating];
					var course_par = tee_data_pointer[| tee_data.par];
			
					// fill in data
					switch screen_index
						{
						case screen.add_score:
						case screen.edit_score:	temp_score_tee = tee;
												temp_score_yardage = course_yardage;
												temp_score_slope = course_slope;
												temp_score_rating = course_rating;
												temp_score_par = course_par;
												break;
												
						case screen.add_course:
						case screen.edit_course: temp_course_tee = tee;
												 temp_course_yardage = course_yardage;
												 temp_course_slope = course_slope;
												 temp_course_rating = course_rating;
												 temp_course_par = course_par;
												 break;
						}

				
					// pop up keyboard
					if screen_index == screen.add_score
					click_textbox_set(temp_score,0,kbv_type_numbers);
					else
					submenu = navbar.hidden;
					}
				else
					{
					temp_course_yardage = "";
					temp_course_slope = "";
					temp_course_rating = "";
					temp_course_par = "";	
						
					// if screen_index == screen.add_course // || screen_index == screen.add_course
					textbox_index = 2;
					// else
						{
						//textbox_index = 1;
						if screen_index == screen.playing
						prev_screen = screen_index;	
						}
					
					// screen_index = screen.edit_course;
					submenu = navbar.hidden;
					}
				}
	        }
	    }

	draw_set_alpha(1);



}
