function draw_score_card() {

var ww = room_width-20;
var hh = 800;
var xsep = ww*0.5;
var ysep = hh/10;
var xx = ((room_width-ww)*0.5)+18;
var yy = 150;
var height = 30;

draw_text_height(xx,yy-55,"Handicap Index: "+string_format(ghin_index,1,1),height*1.2);

draw_line_pixel(xx-18,yy-15,ww,1,c_black,0.5);
draw_line_pixel(room_width*0.5,yy-15,1,hh+15,c_black,0.5);

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
	
	draw_text_height(xx+(xsep*(i>=10)),yy+((i mod 10)*ysep),date_str,height); // draw date
	draw_text_height(xx+180+(xsep*(i>=10)),yy+((i mod 10)*ysep)-4,string(score_)+active,height*1.2,fn_bold); // draw score
	draw_text_height(xx+(xsep*(i>=10)),yy+35+((i mod 10)*ysep),course_name,height*0.8); // draw course name
	}
	
	
if androidBack
screen_goto_prev(navbar.main);


}
