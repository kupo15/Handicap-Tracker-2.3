function draw_score_card_details() {

// draw header
draw_screen_header(headerType.back,headerType.none,"Round Details");	

var xx = 30;
var yy = header_height+300;

draw_line_pixel(0,yy,app_width,1,c_gray,0.8);

var height = 40;
var course_name = activeStruct.courseName;
var course_height = text_reduce(course_name,app_width*0.8,height);

draw_text_height(xx,yy+10,course_name,course_height); // course name

yy += height;
var height = 30;

var round_pointer = activeStruct.roundData;
var round_date = round_pointer.roundDate;

var month = date_get_month(round_date);
var month_str = funct_convert_month(current_month,false);

var day = date_get_day(round_date);
var year = date_get_year(round_date);

var date_str = month_str+" "+string(day)+", "+string(year);

draw_text_height_color(xx,yy+15,date_str,c_gray,height,fn_italic); // round date

// draw score
var height = 80;
var xx = 100;
yy += 100;

var net_score = round_pointer.netScore;
var strokes = round_pointer.roundStrokes;

draw_text_height(xx,yy,net_score,height,fn_bold);

// to par
var tee_pointer = activeStruct.teeData;
var tee_par = tee_pointer.teePar;

var stroke_score = real(net_score)-real(tee_par);
var str = "+"+string(stroke_score);
var height = 60;

draw_text_height(xx+250,yy,str,height,fn_bold);

var xoff = string_width_height(net_score,height);

if strokes != 0
draw_text_height(xx+xoff,yy,"+"+string(strokes),height*0.7);

// draw tee marker
var xx = 30;
yy += height;

var tee_color = tee_pointer.teeColor;
var tee_yardage = tee_pointer.teeYardage;
var tee_slope = tee_pointer.teeSlope;
var tee_rating = tee_pointer.teeRating;

var str = capitalize(tee_color)+" "+tee_yardage+" yds ("+tee_slope+" / "+tee_rating+")";

draw_tee_marker(xx,yy+30,40,tee_color,str,true);

// draw diff
yy += 100;
var height = 40;
var adj_diff = activeStruct.handicapData.adjDiff;

draw_text_height(xx,yy,"Adj. Diff: "+string(adj_diff),height);

if androidBack
screen_goto_prev();
}