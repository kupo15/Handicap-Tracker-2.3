
function draw_score_create() {
draw_score_view();	
}

function draw_score_view() {

var bg_col = c_lt_gray;
draw_clear(bg_col);

activeStruct = workingStruct;
var course_name = activeStruct.courseName;

var tee_pointer = activeStruct.teeData;
var course_tee = tee_pointer.teeColor;
var course_yardage = tee_pointer.teeYardage;
var course_slope = tee_pointer.teeSlope;
var course_rating = tee_pointer.teeRating;

var round_pointer = activeStruct.roundData;
var roundScore = round_pointer.grossScore;
var roundStrokes = round_pointer.roundStrokes;

var handicap_pointer = activeStruct.handicapData;
var round_type = handicap_pointer.roundType;
var off_season = handicap_pointer.offSeason;

#region draw course
var xx = 0;
var yy = 100;
var ww = app_width-xx-xx;
var hh = 90;
var sep = 130;

if draw_dialogue_box(xx,yy,ww,hh,c_white,navbar.hidden)
submenu = navbar.coursebar;

var label_height = 30;
var height = 35;
var course_height = text_reduce(course_name,ww-30,height);

draw_set_halign(fa_left);
draw_text_height(xx+30,yy+5,"Course",label_height,fn_italic); // draw course name label
draw_text_height_label(xx+30,yy+35,course_name,"Select Course",course_height); // draw course name
#endregion

#region draw tee
var xx = 0;
var yy = 190;
var ww = app_width-xx-xx;
var hh = 90;
var height = 35;

if draw_dialogue_box(xx,yy,ww,hh,c_white,navbar.hidden)
if course_name != ""
submenu = navbar.teebar;

draw_line_pixel(20,yy,app_width,1,c_lt_gray,1);

var str = string(capitalize(course_tee))+" "+string(course_yardage)+" yds ("+string(course_slope)+" / "+string(course_rating)+")";
if course_tee == ""
var str = "";

draw_set_halign(fa_left);
draw_text_height(xx+30,yy+5,"Tee",label_height,fn_italic); // draw course tee markers label
draw_text_height_label(xx+30,yy+35,str,"Select Tee",height); // draw course name
#endregion

#region draw score/strokes
var xx = 0;
var yy = 300;
var ww = app_width-xx-xx;
var hh = 90;

draw_roundrect_color(xx,yy,xx+ww,yy+hh,c_white,c_white,false);
draw_line_pixel(ww*0.5,yy+10,1,hh-20,c_gray,1);

var height = 45;

// draw labels
draw_set_halign(fa_left);
draw_text_height(xx+20,yy+5,"Gross Score",label_height,fn_italic); // draw score label
draw_text_height(xx+20+(ww*0.5),yy+5,"Strokes Reduced",label_height,fn_italic); // draw score label

// draw values
draw_text_height_label(xx+30,yy+40,roundScore,"enter score",height);
draw_text_height_label(xx+30+(ww*0.5),yy+40,roundStrokes,"0",height);

// click on strokes
if click_region_released(xx,yy,ww,hh,true,navbar.hidden,1) // score/strokes
	{	
	workingStruct = struct_undo_push(workingStruct,activeStruct,"roundData");

	screen_change(screen.score_details);
	click_textbox_set(roundScore,textboxEntry.grossScore,kbv_type_numbers);
	}
	
#endregion
	
	
#region draw practice/off season
var hh = 90;
var xx = 0;
var yy = 780;
var ww = app_width-xx-xx;

if draw_dialogue_box(xx,yy,ww,hh,c_white,navbar.hidden) // practice tab
submenu = navbar.roundtype;
	
var height = 40;
var str_arr = ["Fun Round","Normal Round","Tournament Round"];
draw_text_height(xx+20,yy+5,"Round Type",label_height,fn_italic); // draw course tee markers label
draw_text_height(xx+20,yy+35,str_arr[round_type],height); // draw course name
#endregion	
	
#region draw calendar
var xx = 0;
var yy = 870;
var ww = app_width-xx-xx;
var hh = 90;
var col = c_white;
var date_pointer = round_pointer.roundDate;

// clicked on calendar
if draw_dialogue_box(xx,yy,ww,hh,col,navbar.hidden)
	{
	scr_set_date_offsets(date_pointer);
	submenu = navbar.calendar;	
	}

draw_line_pixel(20,yy,app_width,1,c_lt_gray,1);

draw_set_halign(fa_left)
draw_text_height(xx+10,yy+10,"Calendar",25);

var str_ww = string_width_height("Calendar",25);
draw_icon_height_centered(spr_ico_calendar,0,xx+10,yy+40,str_ww,45,45,1); // draw calendar icon

var day = date_get_day(date_pointer);
var month = date_get_month(date_pointer);
var year = date_get_year(date_pointer);

var month_str = funct_convert_month(month,false);
var date_str = string(month_str)+" "+string(day)+", "+string(year);

draw_text_height_color(xx+115,yy+50,date_str,c_gray,35);

// pressed OK in calendar
if calendarDateEntry != undefined
	{
	activeStruct.roundData.roundDate = calendarDateEntry;
	calendarDateEntry = undefined;
	}
	
#endregion	
			  			 	  			
#region Save
var submit = (course_tee != "") && (roundScore != "");
var hh = element_finished.hh;
var height = element_finished.stringHeight;
var xx = 0;
var yy = app_height-hh;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,navbar.hidden) && submit
	{
	// update offseason
	activeStruct.handicapData.offSeason = scr_score_update_offseason(activeStruct);
			
	// update score
	scorelist_array[@ score_index] = struct_undo_pop(workingStruct,true);

	// sort
	scoresort;
	scr_handicap_calculate();

	app_save;	
	androidBack = true;
	}
#endregion	

// draw round type overlay
var round_type = draw_overlay_roundtype(round_type);
if round_type != undefined
	{
	handicap_pointer.roundType = round_type;
	submenu = navbar.hidden;
	}

// draw coursebar overlay
if draw_submenu_course_search(header_height,app_width,90,COURSE_database,offsetScroll.courselistOffset)
	{
	submenu = navbar.hidden;

	// if clicking the same course as selected
	if course_name == returnedSearch.courseName
	exit;
	
	// set values
	course_struct = returnedSearch;
	
	// set course data
	activeStruct.courseID = course_struct.courseID;
	activeStruct.courseName = course_struct.courseName;
	activeStruct.districtInd = course_struct.districtInd;
	activeStruct.courseLocation = course_struct.courseLocation;
	
	// reset tee struct
	activeStruct.teeData = {
		
		teeColor: "",
		teeYardage: "",
		teeSlope: "",
		teeRating: "",
		teePar: "",
		}
		
	// open teebar 
	submenu = navbar.teebar;
	}

// draw teebar overlay
var tee_ind = draw_teebox_list(course_struct);
if tee_ind != undefined
	{
	submenu = navbar.hidden;
	
	// set variables
	scr_score_tee_update(activeStruct,course_struct,teebox_list[| tee_ind]);
	}

#region header
var str = pick("View Score","Enter Round",screenIndex == screen.score_create);
var trash_delete = draw_screen_header(headerType.back,headerType.trash,str);	

if trash_delete
	{
	array_delete(scorelist_array,score_index,1); // delete score
	app_save;
	
	androidBack = true;
	}
#endregion

// navigation
if androidBack
&& !kvActive
	{
	if (submenu > navbar.hidden)
	submenu = navbar.hidden;
	else if (submenu == navbar.hidden)
		{
		// reset variables	
		textboxIndex = undefined;
		score_index = undefined;

		score_struct = undefined;
		course_struct = undefined;
		
		workingStruct = undefined;
		activeStruct = undefined;

		screen_goto_prev(navbar.main);
		}
	}
}





















