function draw_course_edit() {
draw_course_add();
}

function draw_course_add() {

var bg_col = c_lt_gray;
var box_col = c_white;	

draw_clear(bg_col);

// header
var str = "Edit Course";

if screenIndex == screen.add_course
str = "Create Course";

draw_screen_header(headerType.back,headerType.none,str);

// textbox entry
if kvActive
switch textboxIndex
	{
	case course_data.name: activeStruct.courseName = string_capitalize(keyboard_string,-1); break;
	}

var course_name = activeStruct.courseName;

#region draw course name
var xx = 40;
var yy = 90;
var ww = app_width-xx-xx-20;
var hh = 120;

var yoff = 35;
var ysep = 80;
var height = 50;
var course_height = text_reduce(course_name,ww,height);

// background
draw_rectangle_color(0,yy,app_width,yy+hh,box_col,box_col,box_col,box_col,false);

// draw course label
draw_set_halign(fa_left);
draw_set_color(c_gray);
draw_text_height(xx,yy+yoff+height,"Course Name",30);

// draw textbox
var ypos_off = 35+height-course_height;
draw_set_color(c_black);
draw_text_height_ext_cursor(xx+5,yy+ypos_off,course_name,"Enter course",-1,ww,0,course_height,0);


if click_region_released(0,yy+20+(0*ysep),app_width,ysep-15,true,navbar.hidden)
click_textbox_set(course_name,0,kbv_type_default);
		
draw_line_pixel(xx,yy+yoff+height+(0*ysep),ww,2,c_gray,0.8); // draw separating line
#endregion

#region draw teebox markers
var xx = 10;
var yy = 270;
var button_hh = 60;
var vsep = 70;
var height = 40;
var ww = app_width-xx-xx;

// size of teebox list
var off_ind = 0;
var size = ds_list_size(teebox_list);
for(var i=0;i<size;i++)
	{
	var has_data = teebox_filled[| i];
	var teeColor = teebox_list[| i];
	var yoff = (i*vsep);

	if has_data //&& (course_struct != undefined)
		{
		// set from temp tee data
		var teeData_pointer = variable_struct_get(workingStruct.subcourses[subcourse_index],string_lower(teeColor));
		var course_yardage = teeData_pointer.teeYardage;
		var course_slope = teeData_pointer.teeSlope;
		var course_rating = teeData_pointer.teeRating;
		var course_par = teeData_pointer.teePar;
		
		var teebox_str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
   		
		off_ind ++;
		}
	else
	var teebox_str = "";

	// clicked on a tee marker
	if draw_dialogue_box(xx,yy+yoff,ww,button_hh,c_white,navbar.hidden)
		{
		scr_course_tee_set(teeColor);

		// set temp entry data
		activeStruct = struct_undo_push(workingStruct,activeStruct.subcourses[subcourse_index],string_lower(teeColor));
		tee_index = i;

		screen_change(screen.edit_tees);
		click_textbox_set(activeStruct.teeYardage,course_data.yardage,kbv_type_numbers);
		}
			
	// draw teebox details
	var str = teebox_list[| i]+" "+teebox_str;	
	draw_tee_marker(xx+25,yy+yoff+10,40,teeColor,str,true); // draw teebox marker
		
	// create tee
	if (i+1) == size // last index
		{
		break;
		
		if click_button(xx,yy+(off_ind*vsep),"add tee marker",height,c_black,ww,button_hh,c_white,true,false,navbar.hidden)
			{
			submenu = navbar.teebar;
			}

		draw_plus_button(xx+83,yy-4+(button_hh*0.5)+(off_ind*vsep),70,false);
		}
	}
#endregion

if virtual_keyboard_enter
vk_hide();

#region delete course
var ww = 170;
var hh = 80;
var xx = 5;
var yy = room_height-hh-5;

if draw_button_trash(xx,yy,ww,hh,ico_trash1,c_red,screen.edit_course,navbar.hidden,true)
	{
	// delete course from courselist
	array_delete(courselist_array,course_index,1);
		
	// original course name
	if course_struct.courseName == play_course_name
	scr_playing_clear();	
	
	app_save;
	
	androidBack = true;
	}
#endregion

#region Save
var submit = (course_name != "");
var ww = 350;
var xx = 185;
var col = lerp(c_lt_gray,c_white,submit);	

// if Create/Save
if (click_button(xx,yy,"Save",height,c_black,ww,hh,col,true,true,navbar.hidden) || keyboard_check_released(vk_enter)) && submit
	{	
	// update course info
	courselist_array[@ course_index] = workingStruct; // overwrite with working copy
	
	array_sort_nested_struct(courselist_array,"courseName",true); // sort list
	app_save;
	
	androidBack = true;
	}
	
#endregion
	
if androidBack 
&& !kvActive
	{		
	// delete course unsaved
	course_struct = undefined;
	workingStruct = undefined;
	activeStruct = undefined;
	
	course_index = undefined;
	textboxIndex = undefined;
		
	// from course edit
	screen_goto_prev(navbar.main);
	}
	
}
