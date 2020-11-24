function falling_off_struct_get() {
	
var list_size = array_length(scorelist_array);
var ind = clamp(round_selection-1,0,list_size-1);

if ind < 0
return -1;
else
return scorelist_array[ind];
}


function draw_falling_off(xx,yy) {

// draw round that will be getting kicked out
var rows = 1;
var sep = 100;
var ww = app_width;
var hh = rows*sep;
var height = 40;
var col = make_color_rgb(232,237,255);

draw_text_height(xx+10,yy-50,"Round Falling Off",50,fn_italic);

var score_pointer = falling_off_struct_get();
if score_pointer == -1
exit;

var course_name = score_pointer.courseName;
var course_tee = score_pointer.teeColor;
var course_yardage = score_pointer.teeYardage;
var course_slope = score_pointer.teeSlope;
var course_rating = score_pointer.teeRating;
var _score = score_pointer.roundScore;
	
var date = score_pointer.roundDate;
var month = date_get_month(date);
var day = date_get_day(date);
var year = date_get_year(date);
var date_string = string(month)+"/"+string(day)+"/"+string(year);
	
var active = "";
if score_pointer.indexIncluded
active = "*";

var course_str = string_abbreviate(course_name,380,height,"...");
draw_text_height(xx,yy+10,course_str,height); // draw course name
draw_text_height(xx+425,yy+15,_score+active,50); // draw score shot
	
// tee info
var str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
draw_tee_marker(xx+10,yy+70,30,course_tee,str,true); // draw tee marker
		
draw_text_height_color(xx+270,yy+80,date_string,c_gray,23); // draw date played

//if strokes != 0
//draw_text_height(xx+472,yy+15+(off_pos*sep),"+"+string(strokes),20); // draw strokes given	

// if clicked
if click_region_released(0,yy-50,ww,sep+50,c_yellow,navbar.main)
screen_change(screen.score_card);
}
