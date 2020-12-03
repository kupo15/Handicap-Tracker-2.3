
function draw_teebox_list(courseStruct) {

if courseStruct == undefined
exit;

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
	var teeColor = teebox_list[| i];
	var teeData_pointer = variable_struct_get(courseStruct.subcourses[subcourse_index].teeData,string_lower(teeColor));
	var has_data = teeData_pointer != undefined;
	
	if has_data
		{
		// set from temp tee data
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
			course_index = database_course_get_index(courseStruct.courseID);
				
			// assign struct
			//course_struct = course_get_struct(courseStruct.courseID);
			workingStruct = struct_copy(courseStruct);
			activeStruct = workingStruct;			
			
			scr_course_tee_set(teeColor);

			// set temp entry data
			activeStruct = struct_undo_push(workingStruct,activeStruct.subcourses[subcourse_index].teeData,string_lower(teeColor));
			tee_index = i;

			screen_change(screen.edit_tees,navbar.numpad);
			click_textbox_set(activeStruct.teeYardage,textboxEntry.courseYardage,kbv_type_numbers);
			}
	    }
	}

draw_set_alpha(1);
return undefined;
}
