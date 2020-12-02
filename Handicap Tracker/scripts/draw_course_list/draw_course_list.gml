function draw_course_list() {
	
var col = c_lt_gray;
draw_clear(col);	

// set offsets
var scrollbar_index = offsetScroll.courselistOffset;
var courselist_offset = offsetArray[scrollbar_index];
var courselist_offset_start = offsetArrayStart[scrollbar_index];

#region draw course list	
var course_next = false;
var xx = 120;
var yy = header_height+header_submenu_height;
var height = 35;
var sep = 110;
var ww = app_width;
var hh = app_height-nav_height-yy;
var rows = hh/sep;
var box_hh_end = yy+hh;

draw_roundrect_color(0,yy,ww,yy+hh,c_white,c_white,false);

var list_size = array_length(courselist_array);
var pos_start = floor(courselist_offset);
var pos_end = min(list_size,ceil(courselist_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-courselist_offset;
	var off_pos = (off_ind*sep);
	
	var courseID = courselist_array[i].courseID;
	var course_favorite = courselist_array[i].favorite;

	var course_pointer = COURSE_database[courseID];
	var course_name = course_pointer.courseName; // course name
	var course_location = course_pointer.courseLocation.stateInitial; // course location
	
	var course_str = string_abbreviate(course_name,485,height,"...");
	var initial = string_char_at(course_name,1);
	
	// draw the circle icon
	var col = c_lt_gray;
	draw_set_halign(fa_center);
	draw_circle_color(65,yy+off_pos+(sep*0.5),30,col,col,false);
	draw_text_height_middled(65,yy+off_pos,initial,sep,height);

	draw_set_halign(fa_left);
	draw_text_height_middled(xx,yy+off_pos-5,course_str,sep,height,1); // draw course name
	draw_icon_height(ico_favorites,course_favorite,app_width-60,yy+off_pos+70,30,1); // draw favorites
	
	//var name_off = string_width_height(course_str,height);
	draw_text_height_middled_color(xx+10,yy+off_pos+height-5,course_location,sep,c_gray,height*0.8,fn_italic); // draw course location
	draw_line_pixel(25,yy+((1+off_ind)*sep),room_width,1,c_black,0.2); // draw row lines
		
	// click released on course
	if click_region_pressed(app_width-75,yy+off_pos+60,75,50,false,navbar.main)
		{
		canClick = false;
		canClickPressed = true;
		clickMoved = true;
	
		courselist_array[i].favorite = !courselist_array[i].favorite; // toggle favorite
		app_save;
		}
	else if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.main,i,courselist_array)
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
			course_struct = COURSE_database[course_index];
			workingStruct = struct_copy(course_struct);
			activeStruct = workingStruct;
//cs(js(activeStruct))
//sm("")
			screen_change(screen.edit_course,navbar.hidden);
			}
		}
	}
#endregion

#region scrolling
var xx = 0;
var sub = navbar.main;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);
#endregion

#region header
var new_course = draw_screen_header(headerType.back,headerType.plus,"Course List");

if new_course
	{
	course_next = true;
	
	course_struct = scr_course_create_database();
	workingStruct = struct_copy(course_struct);
	activeStruct = workingStruct;
			
	course_index = array_length(courselist_array);

	screen_change(screen.add_course);
	click_textbox_set("",course_data.name,kbv_type_default);
	}

var sort_index = META_data.courseSort;
var offset = offsetArray[offsetScroll.courseSortUnderline];
var header = draw_screen_header_submenu(offset,sort_index,"A-Z","Popular","Favorites");
if (header != undefined) && (header != sort_index)
	{
	scr_course_list_sort(header);
	app_save;
	}
#endregion

// draw lt gray cover
draw_rectangle_color(0,box_hh_end,app_width,app_height,col,col,col,col,false);	
	
	
// go to course edit/add
if course_next 
	{
	submenu = navbar.hidden;
	scr_tee_filled_set(); // mark tees with data
	}
	
exit;	
	
#region new course button
var hh = 110;
var xx = 0;
var ww = app_width-xx-xx;
var yy = room_height-hh-nav_height-10;

// clicked on course create
if click_button(xx,yy,"Add Course",50,c_black,ww,hh,c_white,true,false,navbar.main)
	{
	course_next = true;
	
	course_struct = scr_course_create_database();
	workingStruct = struct_copy(course_struct);
	activeStruct = workingStruct;
			
	course_index = array_length(courselist_array);

	screen_change(screen.add_course);
	click_textbox_set("",course_data.name,kbv_type_default);
	}
	
draw_plus_button(xx+130,yy+(hh*0.5)-3,70,false);

#endregion

}













