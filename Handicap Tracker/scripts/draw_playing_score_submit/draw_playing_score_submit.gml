function draw_playing_score_submit(){
	
// header
draw_screen_header(headerType.back,headerType.none,"Enter Score");

// keyboard entry
if kvActive
switch textboxIndex
	{
	case textboxEntry.grossScore: activeStruct.grossScore = string_convert_real(numpad_value,3); break;
	case textboxEntry.strokes: activeStruct.roundStrokes = string_convert_real(numpad_value,2); break;
	}

var play_score = activeStruct.grossScore;
var play_strokes = activeStruct.roundStrokes;	
	
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
	screen_change(screen.score_details);
	click_textbox_set(play_score,textboxEntry.grossScore,kbv_type_numbers);
	}
	
#endregion

exit;

// clicked enter
if virtual_keyboard_enter
switch textboxIndex
	{
	case textboxEntry.grossScore: click_textbox_set(play_score,textboxEntry.strokes,kbv_type_numbers); break;
			
	case textboxEntry.strokes: vk_hide(); break;
	}

#region submit round
var submit = (active_course_struct != undefined) && (course_teeColor != "") && (play_score != "");
var xx = 185;
var hh = 95;
var ww = app_width-xx-1;
var col = pick(c_gray,header_color,submit);

// clicked submit round
if click_button(xx,yy,"Submit Round",height,c_black,ww,hh,col,true,false,navbar.main) && submit
	{	
	// create score
	if play_strokes == ""
	play_strokes = 0;
	
	var net_score = real(play_score)-real(play_strokes);
	var date = date_create_datetime(current_year,current_month,current_day,1,1,1); 
	scr_score_add_index(course_name,course_teeColor,play_score,date,play_strokes);
	
	// save data
	scr_handicap_calculate();
	
	active_course_struct = create_score; // clear active course

	screen_change(screen.home,navbar.main);
	app_save;
	}
#endregion
}