
function draw_teebox_list() {

var teebar_yoff_start = offsetArray[offsetScroll.teebarYoff];
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
		var teeData_pointer = variable_struct_get(course_struct.subcourses[subcourse_index].teeData,string_lower(teeColor));
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
		else
			{			
			// assign struct
			/*course_struct = course_find_array(score_struct.courseName);
			workingStruct = struct_copy(course_struct);
			activeStruct = workingStruct;

			tee_index = i;

			scr_course_tee_set(teeColor);
			screen_change(screen.edit_tees,navbar.numpad);
			
			submenu = navbar.hidden;*/
			//scr_tee_filled_set(); // mark tees with data
			}
	    }
	}

draw_set_alpha(1);
return undefined;
}
