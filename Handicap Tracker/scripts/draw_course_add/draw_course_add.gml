function draw_course_add() {

// header
var str = "Edit Course";

if screenIndex == screen.add_course
str = "Create Course";

draw_screen_header(headerType.back,headerType.none,str);

// textbox entry
if kvActive
switch textboxIndex
	{
	case course_data.name: course_edit_name = string_capitalize(keyboard_string,-1); break;
	}

// draw course name
var xx = 20;
var yy = 120;
var sep = 120;
var height = 70;
var ww = app_width;

var course_name = course_edit_name;
var height = 70;
var course_height = text_reduce(course_name,500,height);

draw_text_height(xx,yy,"Course",height*0.6,fn_italic); // draw course name label
draw_text_height_ext_cursor(xx,yy+40,course_name,"Enter course name",-1,room_width,0,course_height,0); // draw course name

// draw teebox markers
var yyy = 270;
var vsep = 60;
var height = 65;

// size of teebox list
var size = ds_list_size(teebox_list);
for(var i=0;i<size;i++)
	{
	var has_data = teebox_filled[| i];
	var teeColor = teebox_list[| i];

	if has_data && course_id != noone
		{
		// set from temp tee data
		var teeData_pointer = variable_struct_get(active_course.teeMap,string_lower(teeColor));
		var course_yardage = teeData_pointer.courseYardage;
		var course_slope = teeData_pointer.courseSlope;
		var course_rating = teeData_pointer.courseRating;
		var course_par = teeData_pointer.coursePar;
	
		var teebox_str = course_yardage+" yds ("+course_slope+"/"+course_rating+")";
		}
	else 
	var teebox_str = "";
		
	// draw teebox details
	var str = teebox_list[| i]+" "+teebox_str;
	draw_text_height_middled(xx+60,yyy+(i*vsep),str,vsep,height*0.7,1); // draw tee
	draw_tee_marker(xx+25,yyy+30+(i*vsep),10,teeColor); // draw teebox marker
    
	// clicked on a tee marker
	if click_region_released(0,yyy+(i*vsep),ww,vsep,true,navbar.hidden,1)
		{
		screen_change(screen.edit_tees);
					
		// set temp entry data
		active_tee = variable_struct_get(active_course.teeMap,string_lower(teeColor));
		tee_index = i;
		
		course_edit_yardage = active_tee.courseYardage;
		course_edit_slope = active_tee.courseSlope;
		course_edit_rating = active_tee.courseRating;
		course_edit_par = active_tee.coursePar;
		
		if screenIndex == screen.add_score || screenIndex == screen.edit_score
			{
			var tee_pointer = course_id[| 1]; // tee marker MAP
			var tee = teebox_list[| teebox_index]; // tee color
				
			var tee_data_pointer = tee_pointer[? tee];
			var course_yardage = tee_data_pointer[| tee_data.yardage];
			var course_slope = tee_data_pointer[| tee_data.slope];
			var course_rating = tee_data_pointer[| tee_data.rating];
			var course_par = tee_data_pointer[| tee_data.par];
			
			// fill in data
			var score_pointer = master_score_list[| index];
			score_pointer[| score_data.tee] = tee;
			score_pointer[| score_data.yardage] = course_yardage;
			score_pointer[| score_data.slope] = course_slope;
			score_pointer[| score_data.rating] = course_rating;
			score_pointer[| score_data.par] = course_par;
			
			// pop up keyboard
			if screenIndex == screen.add_score
			click_textbox_set(score_pointer[| score_data.score_],0,kbv_type_numbers);
			else
			submenu = navbar.hidden;
			}
		}
	}
	
// if clicked on course name
if click_region_released(0,yy+(0*sep),ww,sep,true,navbar.hidden,1)
click_textbox_set(course_edit_name,course_data.name,kbv_type_default);			
	
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
	array_delete(courselist_array,index,1);
		
	// original course name
	if course_id.courseName == play_course_name
	scr_playing_clear();	
			
	active_course = undefined;
	textboxIndex = noone;
	screen_goto_prev(navbar.main);
	index = 0;
	
	app_save;
	exit;
	}
#endregion

#region Create
var submit = 1; 
/*((course_edit_name != "") && (textboxIndex <= 0)) 
|| ((textboxIndex > 0) && ((temp_course_yardage != "") && (temp_course_slope != "") && (temp_course_rating != "") && (temp_course_par != ""))
|| (temp_course_yardage == "") && (temp_course_slope == "") && (temp_course_rating == "") && (temp_course_par == ""));
	*/
var ww = 350;
var xx = 185;
	
// draw Create/Next box
draw_set_alpha(0.5+(0.5*submit));

// if Create/Save
var str = "Save";

if (click_button(xx,yy,str,height,c_black,ww,hh,c_white,true,true,navbar.hidden) || keyboard_check_released(vk_enter)) && submit
	{	
	// update course info
	scr_course_details_update();
			
	screen_goto_prev(navbar.main);
	array_sort_nested_struct(courselist_array,"name",true); // sort list
	
	app_save;
	}
	
draw_set_alpha(1);
#endregion
	
if androidBack 
&& !kvActive
	{
	// if coming from another screen
	if prev_screen != noone
		{
		screen_goto_prev(navbar.teebar);
		exit;
		}
		
	// delete course unsaved
	active_course = undefined;
	course_index = undefined;
	textboxIndex = noone;
		
	// from course edit
	screen_goto_prev(navbar.main);
	index = 0;
	}
	
}
