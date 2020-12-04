function draw_playing_score_submit() {

activeStruct = workingStruct.roundData;

// header
draw_screen_header(headerType.back,headerType.none,"Enter Score");
//draw_screen_header_submenu();

// keyboard entry
if kvActive
switch textboxIndex
	{
	case textboxEntry.grossScore: activeStruct.grossScore = string_convert_real(numpad_value,3); break;
	case textboxEntry.strokes: activeStruct.roundStrokes = string_convert_real(numpad_value,2); break;
	}

var play_score = activeStruct.grossScore;
var play_strokes = activeStruct.roundStrokes;
var play_date = activeStruct.roundDate;

var handicap_pointer = workingStruct.handicapData;
var round_type = handicap_pointer.roundType;
var off_season = handicap_pointer.offSeason;
	
#region draw score/strokes
var xx = 0;
var yy = 300;
var ww = app_width-xx-xx;
var hh = 90;

draw_roundrect_color(xx,yy,xx+ww,yy+hh,c_white,c_white,false);
draw_line_pixel(ww*0.5,yy+10,1,hh-20,c_gray,1);

var label_height = 30;
var height = 45;

// draw labels
draw_set_halign(fa_left);
draw_text_height(xx+20,yy+5,"Gross Score",label_height,fn_italic); // draw score label
draw_text_height(xx+20+(ww*0.5),yy+5,"Strokes Reduced",label_height,fn_italic); // draw score label

// draw values
draw_text_height_label(xx+30,yy+40,play_score,"enter score",height);
draw_text_height_label(xx+30+(ww*0.5),yy+40,play_strokes,"0",height);

// click on strokes
if click_region(xx,yy,ww,hh,true,mb_left,navbar.hidden) // score/strokes
	{	
	workingStruct = struct_undo_push(workingStruct);

	screen_change(screen.score_details);
	click_textbox_set(play_score,textboxEntry.grossScore,kbv_type_numbers);
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
var date_pointer = play_date;

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
	activeStruct.roundDate = calendarDateEntry;
	calendarDateEntry = undefined;
	}
	
#endregion	

// draw round type overlay
var round_type = draw_overlay_roundtype(round_type);
if round_type != undefined
	{
	handicap_pointer.roundType = round_type;
	submenu = navbar.hidden;
	}

#region Save
var submit = (play_score != "");
var hh = element_finished.hh;
var height = element_finished.stringHeight;
var xx = 0;
var yy = app_height-hh;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Submit Round",height,c_white,ww,hh,col,false,false,navbar.hidden) && submit
	{	
	// create score
	if play_strokes == ""
	play_strokes = 0;

	workingStruct.handicapData.offSeason = scr_score_update_offseason(workingStruct);
	array_push(scorelist_array,workingStruct);

	// save data
	scr_handicap_calculate();
	
	// clear active course
	course_struct = undefined;		
			
	workingStruct = undefined;
	activeStruct = undefined;
		
	active_course_struct = create_score; 

	screen_change(screen.home,navbar.main,true);
	app_save;
	}
#endregion

if androidBack
&& !kvActive
	{
	if (submenu > navbar.hidden)
	submenu = navbar.hidden;
	else if (submenu == navbar.hidden)
	screen_goto_prev();
	}
	
exit;

// clicked enter
if virtual_keyboard_enter
switch textboxIndex
	{
	case textboxEntry.grossScore: click_textbox_set(play_score,textboxEntry.strokes,kbv_type_numbers); break;
			
	case textboxEntry.strokes: vk_hide(); break;
	}

}