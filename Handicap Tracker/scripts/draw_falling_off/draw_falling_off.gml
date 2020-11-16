
function draw_falling_off(xx,yy) {

// draw round that will be getting kicked out
var rows = 1;
var sep = 100;
var ww = app_width;
var hh = rows*sep;
var height = 40;

var col = make_color_rgb(232,237,255);
var tee_str_col = make_color_rgb(38,72,106);

draw_text_height(xx+10,yy-50,"Round Falling Off",50,fn_italic);

var list_size = array_length(scorelist_array);
for(var i=0;i<rows;i++)
	{
	var slot = clamp(round_selection-1,0,list_size-1);
	var score_pointer = scorelist_array[slot];
	var course_name = score_pointer.courseName;
	var course_tee = score_pointer.teeColor;
	var course_yardage = score_pointer.courseYardage;
	var course_slope = score_pointer.courseSlope;
	var course_rating = score_pointer.courseRating;
	var _score = score_pointer.roundScore;
	
	var date = score_pointer.roundDate;
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_string = string(month)+"/"+string(day)+"/"+string(year);
	var off_pos = i; // slot-score_list_offset;
	
	var active = "";
	if score_pointer.indexIncluded
	active = "*";

	var course_str = string_abbreviate(course_name,380,height,"...");
	draw_text_height(xx,yy+10+(off_pos*sep),course_str,height); // draw course name
	draw_text_height(xx+425,yy+15+(off_pos*sep),_score+active,50); // draw score shot
	
	// tee info
	draw_roundrect_color_ext(xx+10,yy+65+(off_pos*sep),xx+245,yy+45+30+(off_pos*sep),25,30,col,col,false); // background
	draw_tee_marker(xx+25,yy+45+35+(off_pos*sep),6,course_tee); // draw tee marker
	
	var str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
	draw_text_height_middled_color(xx+40,yy+65+(off_pos*sep),str,30,tee_str_col,25,1); // draw slope/rating
	
	draw_text_height_color(xx+260,yy+70+(off_pos*sep),date_string,c_gray,23); // draw date played

	//if strokes != 0
	//draw_text_height(xx+472,yy+15+(off_pos*sep),"+"+string(strokes),20); // draw strokes given	
	}

// if clicked
if click_region_released(0,yy-50,ww,sep+50,c_yellow,navbar.main)
	{
	screenIndex = screen.score_card;
	submenu = navbar.hidden;
	}

}
