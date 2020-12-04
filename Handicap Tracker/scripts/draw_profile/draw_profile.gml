function draw_profile_create() {
	
draw_profile_view();	
}

function draw_profile_view() {
	
var show_trash = pick(headerType.trash,headerType.none,profile_index == 0);
var trash = draw_screen_header(headerType.back,show_trash,"Edit Profile");

if trash
	{
	array_delete(ROOT_data_struct.profiles,profile_index,1); // delete
	scr_profile_set(0);
	screen_change(screen.home,navbar.main,true);
	}

var disp_name = activeStruct.dispName;
var home_courseID = PROFILE_data.homeCourseID;

#region draw name
var xx = 60;
var yy = 300;
var sep = 110;
var label_height = 25;
var height = 40;

draw_text_height(xx,yy,"Name",label_height);
draw_text_height(xx,yy+25,disp_name,height);
draw_icon_width(ico_edit,0,app_width-60,yy+25,30,1); // edit icon
draw_line_pixel(100,yy+sep,app_width-100,1,c_lt_gray,1);

if click_region_released(0,yy,app_width,sep,true,navbar.hidden,1)
	{
	click_textbox_set(disp_name,textboxEntry.popupEntryText,kbv_type_default);
	submenu = navbar.popupEntry;
	}
#endregion

#region draw course
var yy = 410;
var ww = app_width-xx-xx;
var hh = 90;
var sep = 110;

var course_pointer = database_course_get_pointer(home_courseID);

if course_pointer == undefined
var course_name = "";
else
var course_name = course_pointer.courseName;

if draw_dialogue_box(0,yy,app_width,sep,c_white,navbar.hidden)
submenu = navbar.coursebar;

var course_height = text_reduce(course_name,ww-30,height);

draw_set_halign(fa_left);
draw_text_height(xx,yy,"Home Course",label_height); // draw course name label
draw_text_height_label(xx,yy+35,course_name,"Select Home Course",course_height); // draw course name
#endregion

#region Finished button
var submit = (disp_name != "")
var hh = element_finished.hh;
var height = element_finished.stringHeight;
var xx = 0;
var yy = app_height-hh;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,navbar.hidden) && submit
	{
	androidBack = true;

	PROFILE_data.dispName = disp_name;
	app_save;
	}
	
#endregion

if androidBack
&& !kvActive
&& submenu == navbar.hidden
	{
	if screenIndex == screen.profileCreate
		{
		array_delete(ROOT_data_struct.profiles,profile_index,1); // delete
		scr_profile_set(0);
		}

	screen_change(screen.home,navbar.main,true);
	}

var name_entry = draw_overlay_popup_entry("Enter your name",activeStruct.dispName,-1);
if name_entry != undefined
activeStruct.dispName = name_entry;

// draw coursebar overlay
if draw_submenu_course_search(header_height,app_width,90,COURSE_database,offsetScroll.courselistOffset)
	{
	// set course data
	PROFILE_data.homeCourseID = returnedSearch.courseID;

	submenu = navbar.hidden;
	app_save;
	}


}