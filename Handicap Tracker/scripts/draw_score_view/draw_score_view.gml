
function draw_score_create() {
draw_score_view();	
}

function draw_score_view() {
	
#region header
var bg_col = c_lt_gray;
draw_clear(bg_col);

var str = pick("View Score","Enter Round",screenIndex == screen.score_create);
var trash_delete = draw_screen_header(headerType.back,headerType.trash,str);	

if trash_delete
	{
	array_delete(scorelist_array,score_index,1); // delete score
	score_index = 0;

	screen_goto_prev(navbar.main);
	app_save;
	exit;
	}
#endregion

var course_name = score_struct.courseName;
var course_tee = score_struct.teeColor;
var course_yardage = score_struct.courseYardage;
var course_slope = score_struct.courseSlope;
var course_rating = score_struct.courseRating;

var roundScore = score_struct.roundScore;
var roundStrokes = score_struct.roundStrokes;
var practice_round = score_struct.practiceRound;

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
	{
	submenu = navbar.teebar;
	scr_tee_filled_set(); // mark tees with data
	}

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
if click_region(xx,yy,ww,hh,true,mb_left,navbar.hidden) // score/strokes
	{	
	click_textbox_set(roundScore,score_data.score_,kbv_type_numbers);
	screen_change(screen.score_details);
	}
	
#endregion
	
#region draw practice
var xx = 0;
var yy = 800;
var ww = app_width-xx-xx;
var hh = 90;

if draw_dialogue_box(xx,yy,ww,hh,c_white,navbar.hidden)
	{
	score_struct.practiceRound = !score_struct.practiceRound;
	}
	
// draw switch tab
draw_switch_tab(xx+450,yy,hh,20,0,practice_round);

var height = 40;
draw_text_height(xx+20,yy+5,"Round Type",label_height,fn_italic); // draw course tee markers label
draw_text_height(xx+20,yy+35,"Practice Round",height); // draw course name
#endregion	
	
#region draw calendar
var xx = 0;
var yy = 890;
var ww = app_width-xx-xx;
var hh = 90;
var col = c_white;
var date_pointer = score_struct.roundDate;

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
	score_struct.roundDate = calendarDateEntry;
	calendarDateEntry = undefined;
	}
	
#endregion	
			  			 	  			
#region Create/Update
var submit = (course_tee != "") && (roundScore != "");
var hh = 60;
var xx = 0;
var yy = app_height-hh;
var height = 40;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,navbar.hidden) && submit
	{
	if roundStrokes == ""
	roundStrokes = "0";
		
	// update score
	scorelist_array[@ score_index] = score_struct;

	// reset variables
	score_list_offset = 0;
	score_list_offset_start = 0;
	
	score_index = undefined;
	
	score_struct = undefined;
	course_struct = undefined;
	
	// sort
	array_sort_nested_struct(scorelist_array,"roundDate",false); // date sort
	scr_handicap_calculate();

	screen_goto_prev(navbar.main);
	app_save;
	}
#endregion	

// draw coursebar overlay
if draw_submenu_course_search(header_height,app_width,90,courselist_array,"course_list_offset")
	{
	submenu = navbar.hidden;

	if course_name == friend_id.courseName
	exit;
	
	// set values
	course_struct = friend_id;
	
	// reset values
	score_struct.courseName = course_struct.courseName;
	score_struct.teeColor = "";
	score_struct.courseYardage = "";
	score_struct.courseSlope = "";
	score_struct.courseRating = "";
	score_struct.coursePar = "";
	
	// open teebar 
	submenu = navbar.teebar;
	scr_tee_filled_set(); // mark tees with data
	}

// draw teebar overlay
var tee_ind = draw_teebox_list();
if tee_ind != undefined
	{
	submenu = navbar.hidden;
	
	// set variables
	scr_score_tee_update(score_struct,course_struct,teebox_list[| tee_ind]);
	}

// navigation
if androidBack 
	{
	if (submenu != navbar.hidden)
	submenu = navbar.hidden;
	else if (submenu == navbar.hidden)
		{
		textboxIndex = undefined;
		score_index = undefined;

		score_struct = undefined;
		course_struct = undefined;	

		screen_goto_prev(navbar.main);
		}
	}
}