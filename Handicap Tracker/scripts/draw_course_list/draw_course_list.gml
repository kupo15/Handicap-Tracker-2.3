function draw_course_list() {
	var course_next = false;
	var xx = 30;
	var yy = 100;
	var height = 40;
	var rows = 9.4;
	var sep = 70;
	var ww = app_width;
	var hh = rows*sep;

	var list_size = ds_list_size(master_course_list);
	var pos_start = floor(course_list_offset);
	var pos_end = min(list_size,ceil(course_list_offset)+rows);
	for(var i=pos_start;i<pos_end;i++)
	    {
		var course_pointer = master_course_list[| i];
	    var course_name = course_pointer[| 0]; // course name
		var course_str = string_abbreviate(course_name,485,height,"...");
		var off_pos = i-course_list_offset;
    
	    draw_text_height(xx,yy+20+(off_pos*sep),course_str,height); // draw course name
		draw_line_pixel(25,yy+((1+off_pos)*sep),room_width,1,c_black,0.2); // draw row lines
		
		// highlight selected
		if mode_delete
		delete_list_draw_selected(0,yy+(off_pos*sep),ww,sep,deleteList,i);

		// clicked on course
		if !mode_delete && click_region_pressed_clamp(0,yy,(off_pos*sep),ww,sep,hh,mb_left,noone,navbar.main,i)
		delete_list_set(master_course_list,i);
		
		// set highlight ypos and height
		if click_region(xx,yy+(off_pos*sep),ww,sep,noone,noone)
		click_highlight_set_clamped(yy,off_pos,sep,hh);

		// click released on course
		if click_region_released_clamp(0,yy,(off_pos*sep),ww,sep,hh,mb_left,c_yellow,navbar.main)
			{
			if mode_delete
				{
				if can_delete
				deleteList[| i] = !delete_list[| i]; // toggle selected
			
				can_delete = true;
				}
			else // select course
				{
		        index = i;
				course_next = true;
				course_edit_name = course_name;
				textboxIndex = -1;
				screenIndex = screen.edit_course;
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

// funct_dialogue_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion

// header
draw_screen_header(headerType.back,headerType.none,"Course List");
    
// new course button
var ww = app_width;
var hh = 95;
var xx = 0;
var yy = room_height-hh-(nav_height*nav_sca_off);
var col = c_white;

draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
draw_rectangle(xx,yy,xx+ww,yy+hh,true);
draw_set_halign(fa_center);
draw_text_height(app_width/2,yy+15,"Add Course",70);

// clicked on course create
if click_region_released(xx,yy,ww,hh,true,noone)
	{
	course_edit_name = "";
	index = scr_course_add_index("","Tee","5000","132","70.2","72");
	click_textbox_set("",0,kbv_type_default);

	screenIndex = screen.add_course;
	teebox_index = 00;
	course_next = true;
	}
    
// go to course edit/add
if course_next 
	    {
		course_id = master_course_list[| index];
		submenu = navbar.hidden;
		scr_tee_filled_set(); // mark tees with data
		scr_tee_set();
	    }

}
