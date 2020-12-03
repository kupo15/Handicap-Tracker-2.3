function draw_score_card() {

//draw_screen_header(headerType.back,headerType.none,"",undefined,c_white);

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

var size = array_length(recent_scores_array);
for(var i=0;i<size;i++)
	{
	var score_pointer = recent_scores_array[i];
	var course_name = string_abbreviate(score_pointer.courseName,210,height*0.8,"...");

	var round_pointer = score_pointer.roundData;
	var net_score = round_pointer.netScore;
	var date = round_pointer.roundDate;
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_str = string(month)+"/"+string(day)+"/"+string(year);
	
	var handicap_pointer = score_pointer.handicapData;
	var active = pick("","*",handicap_pointer.indexIncluded);

	var xoff = xsep*(i>=10);
	var yoff = (i mod 10)*ysep;
	
	draw_text_height(xx+xoff,yy+10+yoff,date_str,height); // draw date
	draw_text_height(xx+180+xoff,yy+yoff+4,string(net_score)+active,height*1.2,fn_bold); // draw score
	draw_text_height(xx+xoff,yy+45+yoff,course_name,height*0.8); // draw course name
	
	if click_region(app_width*0.5*(i>=10),yy+yoff,app_width*0.5,ysep,true,mb_left,submenu)
		{
		activeStruct = score_pointer;
		screen_change(screen.score_card_details);
		}
	}
	
	
if androidBack
screen_goto_prev(navbar.main);
}
