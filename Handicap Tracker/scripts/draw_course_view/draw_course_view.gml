function draw_course_create() {
draw_course_view();
}

function draw_course_view() {

var bg_col = c_lt_gray;
var box_col = c_white;	

draw_clear(bg_col);

#region header
var str = pick("Edit Course","Create Course",screenIndex == screen.create_course);
var trash_delete = draw_screen_header(headerType.back,headerType.trash,str);	

if trash_delete
	{
	// delete course from courselist
	array_delete(courselist_array,course_index,1);
		
	// original course name
	if course_struct.courseName == active_course_struct.courseName
	active_course_struct = create_score; // clear active course
	
	app_save;
	androidBack = true;
	}
#endregion

activeStruct = workingStruct;

// textbox entry
if kvActive
switch textboxIndex
	{
	case textboxEntry.courseName: activeStruct.courseName = string_capitalize(keyboard_string,-1); break;
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
vk_hide(navbar.locationbar);

draw_line_pixel(20,yy,app_width,1,c_lt_gray,1);

var str = "";
if location_struct != undefined
	{
	var str = location_struct.stateName;
		
	var district_index = activeStruct.districtInd;
	var district_pointer = location_struct.districts[district_index];

	if district_pointer.yearRound
	var season_str = "Year-Round";
	else
	var season_str = scr_handicap_season_date(district_pointer);
	var season_height = height*0.8;
	
	draw_text_height_color(330,yy+5,"Golf Season",c_gray,label_height,fn_italic); // draw label
	draw_text_height_color(330,yy+40,season_str,c_gray,season_height,fn_italic); // draw date
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
	var yoff = (i*vsep);

	var teeColor = teebox_list[| i];
	var teeData_pointer = variable_struct_get(workingStruct.subcourses[subcourse_index].teeData,string_lower(teeColor));

	if teeData_pointer != undefined
		{
		// set from temp tee data
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
		// set temp entry data
		workingStruct = struct_undo_push(workingStruct);
		activeStruct = scr_course_tee_set(workingStruct.subcourses[subcourse_index].teeData,teeColor);
		
		tee_index = i;

		screen_change(screen.edit_tees,navbar.numpad);
		click_textbox_set(activeStruct.teeYardage,textboxEntry.courseYardage,kbv_type_numbers);
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
var submit = (course_name != "") && (location_struct != undefined);
var hh = element_finished.hh;
var height = element_finished.stringHeight;
var xx = 0;
var yy = app_height-hh;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,navbar.hidden) && submit
	{	
	// update course info
	COURSE_database[@ course_index] = struct_undo_pop(workingStruct,true); // overwrite with working copy
	
	if screenIndex = screen.create_course
	scr_course_add_local(activeStruct.courseID,courselist_array);
		
	coursesort; // sort list
	app_save;
	
	androidBack = true;
	}
	
#endregion
	
if submenu == navbar.locationbar
	{
	draw_clear(c_white);
	
	var arr = draw_handicap_season();	
	if arr != undefined
		{
		var struct = arr[0];
		var district = arr[1];

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

