function draw_course_edit() {
draw_course_add();
}

function draw_course_add() {

var bg_col = c_lt_gray;
var box_col = c_white;	

draw_clear(bg_col);

#region header
var str = pick("Edit Course","Create Course",screenIndex == screen.add_course);
var trash_delete = draw_screen_header(headerType.back,headerType.trash,str);	

if trash_delete
	{
	// delete course from courselist
	array_delete(courselist_array,course_index,1);
		
	// original course name
	if course_struct.courseName == play_course_struct.courseName
	play_course_struct = scr_score_create("");	
	
	app_save;
	androidBack = true;
	}
#endregion

// textbox entry
if kvActive
switch textboxIndex
	{
	case course_data.name: activeStruct.courseName = string_capitalize(keyboard_string,-1); break;
	}

var course_name = activeStruct.courseName;
var location_struct = activeStruct.courseLocation;

#region draw course name
var xx = 0;
var xoff = 30;
var yy = 90;
var ww = app_width-xoff-xoff-25;
var hh = 100;

var yoff = 35;
var ysep = 80;
var height = 45;
var course_height = text_reduce(course_name,ww,height);
var label_height = 30;

// background
draw_rectangle_color(0,yy,app_width,yy+hh,box_col,box_col,box_col,box_col,false);

// draw course label
draw_set_halign(fa_left);
draw_text_height_color(xx+xoff+5,yy+5,"Course Name",c_gray,label_height,fn_italic); // draw course tee markers label

// draw textbox
var ypos_off = 35+height-course_height;
draw_set_color(c_black);
draw_text_height_ext_cursor(xx+35,yy+ypos_off,course_name,"Enter course",-1,-1,0,course_height,0);

if click_region_released(0,yy+(0*ysep),app_width,hh,true,navbar.hidden)
click_textbox_set(course_name,0,kbv_type_default);
		
if kvActive
draw_line_pixel(xx+xoff,yy+yoff+height+(0*ysep),ww,2,header_color,0.8); // draw separating line
#endregion

#region course location
var xx = 0;
var yy = 190;
var ww = app_width-xx-xx;
var hh = 90;
var height = 35;

if draw_dialogue_box(xx,yy,ww,hh,c_white,navbar.hidden)
if course_name != ""
submenu = navbar.locationbar;

draw_line_pixel(20,yy,app_width,1,c_lt_gray,1);

var str = "";

if location_struct != undefined
	{
	var str = location_struct.stateName;
		
	}

draw_set_halign(fa_left);
draw_text_height_color(xx+30,yy+5,"Location",c_gray,label_height,fn_italic); // draw course tee markers label
draw_text_height_label(xx+30,yy+35,str,"Select Location",height); // draw course name
#endregion

#region draw teebox markers
var xx = 10;
var yy = 300;
var button_hh = 80;
var vsep = 90;
var height = 40;
var ypos_off = (button_hh-40)*0.5;
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

		screen_change(screen.edit_tees,navbar.numpad);
		click_textbox_set(activeStruct.teeYardage,course_data.yardage,kbv_type_numbers);
		}
			
	// draw teebox details
	var str = teebox_list[| i]+" "+teebox_str;	
	draw_tee_marker(xx+25,yy+yoff+ypos_off,40,teeColor,str,true); // draw teebox marker
		
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

#region Finished button
var submit = (course_name != "");
var hh = element_finished.hh;
var height = element_finished.stringHeight;
var xx = 0;
var yy = app_height-hh;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,navbar.hidden) && submit
	{	
	// update course info
	courselist_array[@ course_index] = workingStruct; // overwrite with working copy
	
	coursesort; // sort list
	app_save;
	
	androidBack = true;
	}
	
#endregion
	
if submenu == navbar.locationbar
	{
	draw_clear(c_white);
	
	var struct = draw_handicap_season();	
	if struct != undefined
		{
		var district = 0;
		
		// save location information
		activeStruct.districtInd = district;
		activeStruct.courseLocation = struct;

		submenu = navbar.hidden;
		}
		
	exit;
	}
	
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

