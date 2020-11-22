
function draw_teebox_list() {

var alph = (teebar_yoff_start/1);
var col = c_black;

draw_set_alpha(alph*0.6);
draw_rectangle_color(0,0,app_width,app_height,col,col,col,col,false);

draw_set_alpha(alph);

var rows = ds_list_size(teebox_list);
var sep = 70;
var ww = app_width;
var hh = rows*sep;
var xx = 0;
var yy = app_height-(hh*teebar_yoff_start);

var col = make_colour_rgb(220,220,255);

draw_set_halign(fa_left);
draw_roundrect_colour(-1,yy,xx+ww,yy+hh,col,col,false);
draw_roundrect(-1,yy,xx+ww,yy+hh,true);

var height = 65;
for(var i=0;i<rows;i++)
	{
	var has_data = teebox_filled[| i];
	var teeColor = teebox_list[| i];
	
	if has_data && (course_struct != undefined)
		{
		// set from temp tee data
		var teeData_pointer = variable_struct_get(course_struct.subcourses[subcourse_index],string_lower(teeColor));
		var course_yardage = teeData_pointer.teeYardage;
		var course_slope = teeData_pointer.teeSlope;
		var course_rating = teeData_pointer.teeRating;
		var course_par = teeData_pointer.teePar;
		
		var teebox_str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
		}
	else 
	var teebox_str = "";
		
	var str = teeColor+" "+teebox_str;
	draw_tee_marker(xx+25,yy+(i*sep)+10,50,teeColor,str,true); // draw teebox marker
	
	// background color for missing data
	if !has_data
		{
		var col = c_gray;
		
		draw_set_alpha(0.4);
		draw_rectangle_color(0,yy+(i*sep),ww,yy+sep+(i*sep),col,col,col,col,false);
		draw_set_alpha(1);
		}

    
	// clicked on a tee marker
	if click_region_released(xx,yy+(i*sep),ww,sep,true,navbar.teebar,alph)
	    {			
		if has_data
		return i;
				
		//var tee = teebox_list[| teebox_index]; // tee color
/*
		// play course
		if screenIndex == screen.playing
			{
			if has_data
				{
				play_course_teebox_index = i;		

				scr_handicap_predict(false);
				scr_handicap_predict(true);
				
				app_save;
				}
			else // go to add tee data
				{
				temp_course_yardage = "";
				temp_course_slope = "";
				temp_course_rating = "";
				temp_course_par = "";
	
				textboxIndex = 1;
				course_id = play_course_struct;
				
				screen_change(screen.edit_course);
				submenu = navbar.hidden;
				}
			
			}
		// add or update score
		else if (screenIndex == screen.add_score) || (screenIndex == screen.edit_score) || (screenIndex == screen.edit_course) || (screenIndex == screen.add_course)
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
				switch screenIndex
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
				if screenIndex == screen.add_score
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
						
				// if screenIndex == screen.add_course // || screenIndex == screen.add_course
				textboxIndex = 2;
				// else
					{
					//textboxIndex = 1;
					if screenIndex == screen.playing
					prev_screen = screenIndex;	
					}
					
				// screenIndex = screen.edit_course;
				submenu = navbar.hidden;
				}
			}*/
	    }
	}

draw_set_alpha(1);
return undefined;
}
