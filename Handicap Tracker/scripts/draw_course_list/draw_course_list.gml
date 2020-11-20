function draw_course_list() {
var col = c_lt_gray;
draw_clear(col);	
	
var course_next = false;
var xx = 30;
var yy = header_height;
var height = 35;
var sep = 80;
var ww = app_width;
var hh = app_height-nav_height-yy-sep-20;
var rows = hh/sep;

draw_roundrect_color(0,yy,ww,yy+hh,c_white,c_white,false);

var list_size = array_length(courselist_array);
var pos_start = floor(course_list_offset);
var pos_end = min(list_size,ceil(course_list_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var course_pointer = courselist_array[i];
	var course_name = course_pointer.courseName; // course name
	var course_str = string_abbreviate(course_name,485,height,"...");
	var off_pos = i-course_list_offset;
    
	draw_text_height_middled(xx,yy+(off_pos*sep),course_str,sep,height,1); // draw course name
	draw_line_pixel(25,yy+((1+off_pos)*sep),room_width,1,c_black,0.2); // draw row lines
		
	// click released on course
	if click_region_released_clamp_array(0,yy,(off_pos*sep),ww,sep,hh,mb_left,c_yellow,navbar.main,i,courselist_array)
		{
		if mode_delete
			{
			if can_delete
			deleteList[| i] = !deleteList[| i]; // toggle selected
			
			can_delete = true;
			}
		else // select course
			{
		    course_index = i;
			course_next = true;
			
			// assign struct
			course_struct = courselist_array[course_index];
			active_course = struct_copy(course_struct);

			screen_change(screen.edit_course);
			break;
			}
		}
	}
	
#region scrolling
var offset_start_pointer = [self,"course_list_offset_start"];
var offset_pointer = [self,"course_list_offset"];
var scrollbar_index = 0;
var xx = 0;
var sub = navbar.main;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion

// header
draw_screen_header(headerType.back,headerType.none,"Course List");
    
draw_rectangle_color(0,yy+hh,app_width,app_height,col,col,col,col,false);	
	
#region new course button
var hh = sep;
var xx = 0;
var ww = app_width-xx-xx;
var yy = room_height-hh-nav_height-10;

// clicked on course create
if click_button(xx,yy,"Add Course",50,c_black,ww,hh,c_white,true,false,navbar.main)
	{
	course_next = true;
	course_struct = scr_course_create("");
	course_index = array_length(courselist_array);

	screen_change(screen.add_course);
	click_textbox_set("",course_data.name,kbv_type_default);
	}
	
draw_plus_button(xx+130,yy+(hh*0.5)-3,70,false);

#endregion
    
// go to course edit/add
if course_next 
	{
	submenu = navbar.hidden;
	scr_tee_filled_set(); // mark tees with data
	}

}
