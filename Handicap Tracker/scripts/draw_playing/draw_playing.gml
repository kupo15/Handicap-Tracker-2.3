function draw_playing() {

var col = c_lt_gray;
draw_clear(col);	
	
// header
draw_screen_header(headerType.back,headerType.none,"Playing Course");

var course_name = activeStruct.courseName;
var course_teeColor = activeStruct.teeColor;

var tee_yardage = activeStruct.teeYardage;
var tee_slope = activeStruct.teeSlope;
var tee_rating = activeStruct.teeRating;
var tee_par = activeStruct.teePar;

var play_handicap_inc = activeStruct.handicap_inc;
var play_handicap_dec = activeStruct.handicap_dec;

var esc = activeStruct.esc;

#region draw course name
var xx = 0;
var yy = 100;
var ww = app_width-xx-xx;
var hh = 90;
var sep = 130;

if draw_dialogue_box(xx,yy,ww,hh,c_white,navbar.main)
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

if draw_dialogue_box(xx,yy,ww,hh,c_white,navbar.main)
if course_name != ""
	{
	submenu = navbar.teebar;
	scr_tee_filled_set(); // mark tees with data
	}

draw_line_pixel(20,yy,app_width,1,c_lt_gray,1);

var str = string(capitalize(course_teeColor))+" "+string(tee_yardage)+" yds ("+string(tee_slope)+" / "+string(tee_rating)+")";
if course_teeColor == ""
var str = "";

draw_set_halign(fa_left);
draw_text_height(xx+30,yy+5,"Tee",label_height,fn_italic); // draw course tee markers label
draw_text_height_label(xx+30,yy+35,str,"Select Tee",height); // draw course name
#endregion

// draw tee info
if course_teeColor != ""
	{
	var tee_str = course_teeColor+" "+tee_yardage+" yds ("+tee_slope+" / "+tee_rating+")";

	if is_nan(ghin_index)
		{
		var _handicap = "N/A";
		var _handicap_under = "";
		var _handicap_over = "";
		var max_under = "";
		var max_over = "";
		}
	else
		{
		var _handicap = scr_course_handicap(ghin_index,tee_slope,tee_rating,tee_par);
		var _handicap_under = "1-"+string(abs((_handicap) mod 18));
		if _handicap mod 18 == 0
		var _handicap_under = "1-18";

		var _handicap_over = string((abs(_handicap) mod 18)+1)+"-18";
			
		var max_under = 2+ceil(_handicap/18);
		var max_over = 2+floor(_handicap/18);
		}
		
	var under_str = play_handicap_dec;
		
	var over_str = play_handicap_inc;
	if over_str == noone
	over_str = "Free Round";
	}
else
	{
	var tee_str = "";
	var _handicap = "";
	var _handicap_under = "---";
	var _handicap_over = "-";
	var max_under = "";
	var max_over = "";
	var tee_par = "";
	var under_str = "";
	var over_str = "";
	}
		
	
#region draw course info
var xx = 0;
var yy = 290;
var ww = app_width-xx-xx;
var hh = app_height-nav_height-80-10;
var height = 35;
var col = c_white; 

draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
	
draw_text_height(xx+10,yy,"Course Handicap: "+string(_handicap),height);
draw_text_height(xx+360,yy,"Par "+string(tee_par),height); // draw par
	
draw_text_height(xx+10,yy+60,"Max Strokes",30,fn_italic); // draw max score
draw_text_height(xx+10,yy+90,"HCP Holes "+string(_handicap_under),35); // draw HCP holes
//draw_text_height(xx+10+270,yy+90,max_score_text(max_under),38,fn_italic); // draw max score
	
if is_real(_handicap) && ((_handicap mod 18) != 0)
	{
	draw_text_height(xx+10,yy+125,"HCP Holes "+string(_handicap_over),35); // draw HCP holes
	//draw_text_height(xx+10+270,yy+125,max_score_text(max_over),38,fn_italic); // draw max score
	}
#endregion	
	
#region predict score to affect handicap
	
var yy = 500;

draw_set_halign(fa_center);
draw_text_height(125,yy,"To Improve Index",25);
draw_text_height(125,yy+30+(0*sep),"Score",40);
draw_text_height(125,yy+30+45,under_str,55);
draw_text_height(125,yy+30+45+70,"or Better",40);

draw_text_height(390,yy,"To Worsen Index",25);
draw_text_height(390,yy+30,"Score",40);
draw_text_height(390,yy+30+45,over_str,55);
draw_text_height(390,yy+30+45+70,"or Worse",40);
draw_set_halign(fa_left);
#endregion
		/*
#region clear playing
var ww = 180;
var hh = 95;
var xx = 1;
var yy = app_height-nav_height-hh-10;
var height = 40;
var col = c_white;
	
// clicked clear course
if click_button(xx,yy,"Clear",height,c_black,ww,hh,col,true,false,navbar.main) // && submit
	{
	scr_playing_clear();
	app_save;
	}
#endregion*/

#region Begin Round
var hh = 80;
var xx = 0;
var yy = app_height-nav_height-hh-10;
var height = 40;
var ww = app_width-xx-xx;
var col = header_color;

if click_button(xx,yy,"Begin Round",height,c_white,ww,hh,col,false,false,navbar.main)
	{
	screen_change(screen.playing_score_enter);
	}
#endregion	


// draw coursebar overlay
if draw_submenu_course_search(header_height,app_width,90,courselist_array,offsetScroll.courselistOffset)
	{
	submenu = navbar.main;
	
	// if clicking the same course as selected
	if course_name == returnedSearch.courseName
	exit;
	
	// set values
	course_struct = returnedSearch;
	activeStruct.courseName = course_struct.courseName;
	
	// reset values
	activeStruct.teeColor = "";
	activeStruct.teeYardage = "";
	activeStruct.teeSlope = "";
	activeStruct.teeRating = "";
	activeStruct.teePar = "";
	
	// open teebar 
	submenu = navbar.teebar;
	scr_tee_filled_set(); // mark tees with data
	}

// draw teebar overlay
var tee_ind = draw_teebox_list();
if tee_ind != undefined
	{
	submenu = navbar.main;
	
	// set variables
	scr_score_tee_update(activeStruct,course_struct,teebox_list[| tee_ind]);
	
	scr_handicap_predict(90,false);
	scr_handicap_predict(activeStruct.handicap_dec,true);
									
	app_save;
	}

if androidBack
&& !kvActive
	{
	if submenu != navbar.main
	submenu = navbar.main;
	else
	screen_goto_prev();
	}


}
