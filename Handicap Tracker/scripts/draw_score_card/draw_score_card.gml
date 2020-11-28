function draw_score_card() {

var ww = app_width-20;
var hh = 850;
var xsep = ww*0.5;
var ysep = hh/10;
var xx = ((app_width-ww)*0.5)+18;
var yy = 180;
var height = 30;

var month = funct_convert_month(current_month,false);
var date_str = month+" "+string(current_day)+", "+string(current_year);

draw_text_height(xx,yy-110,string(PROFILE_data.dispName),height);
draw_text_height(xx,yy-80,"Rounds Played: "+string(rounds_played),height);
draw_text_height(xx,yy-50,"Handicap Index: "+string_format(ghin_index,1,1),height*1.1);
draw_text_height_color(380,yy-45,date_str,c_gray,height*0.8,fn_italic);

draw_line_pixel(xx-18,yy-15,ww,1,c_black,0.5);
draw_line_pixel(app_width*0.5,yy-15,1,hh+15,c_black,0.5);

var size = ds_list_size(recent_scores_list);
for(var i=0;i<size;i++)
	{
	var score_pointer = recent_scores_list[| i];
	var _strokes = score_pointer.roundStrokes;
	
	if _strokes == ""
	_strokes = 0;
		
	var course_name = string_abbreviate(score_pointer.courseName,210,height*0.8,"...");
	var score_ = real(score_pointer.roundScore)-real(_strokes);
	
	var date = score_pointer.roundDate;
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_str = string(month)+"/"+string(day)+"/"+string(year);
	
	var active = "";
	if score_pointer.indexIncluded
	active = "*";
	
	var xoff = xsep*(i>=10);
	var yoff = (i mod 10)*ysep;
	
	draw_text_height(xx+xoff,yy+yoff,date_str,height); // draw date
	draw_text_height(xx+180+xoff,yy+yoff-4,string(score_)+active,height*1.2,fn_bold); // draw score
	draw_text_height(xx+xoff,yy+35+yoff,course_name,height*0.8); // draw course name
	
	if click_region(app_width*0.5*(i>=10),yy+yoff,app_width*0.5,ysep,true,mb_left,submenu)
	screen_change(screen.score_card_details);
	}
	
	
if androidBack
screen_goto_prev(navbar.main);
}
