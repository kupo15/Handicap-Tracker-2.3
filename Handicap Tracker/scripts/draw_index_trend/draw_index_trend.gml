/// @param x
/// @param y
/// @param ww_hh
/// @param ymin
/// @param ymax
function draw_index_trend() {

var xx = 60;
var yy = 750;
var ww = app_width-xx-8;
var hh = 400;
var ymin = 100; // lowest index number
var ymax = 0;
var tick_ll = 5; // tick length
var max_disp = 8; // indices at one time
var starting_pos = 0;

#region set the y axis
var size = ds_list_size(included_scores);
var pos_end = clamp(size-starting_pos,0,size);
for(var i=0;i<pos_end;i++)
	{
	var score_pointer = included_scores[| i];
	var index = score_pointer.indexHistory;

	if index < ymin
	ymin = index;
	
	if index > ymax
	ymax = index;
	}

ymin = max(ymin-2,0);
ymax += 1;
#endregion

var ticks = (ymax-ymin)*10;
var ysep = hh/ticks;

if handicap_trend_type == 1
var max_disp = size;
		
index_trend_offset += funct_mouse_wheel(1);
index_trend_offset = clamp(index_trend_offset,0,size-max_disp);
	
// draw the hor trends
var col = c_black;
var xsep = (ww-8)/(min(size,max_disp)-1);
var xprev = xx;
var yprev = yy-500;

var pos_start = floor(index_trend_offset)+starting_pos;
var pos_end = min(pos_start+max_disp+1,size);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-index_trend_offset-starting_pos;
	var off_pos = off_ind*xsep;
	var n = i;
	
	var pointer = included_scores[| n];
	var ind = pointer.indexHistory; // get the index
	var teeColor = pointer.teeColor;

	var date = pointer.roundDate; // get the date
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_str = string(funct_convert_date(month,false,noone,noone))+" "+string(day)+", "+string(year);
	
	var xpos = xx+8+off_pos;
	var ypos = yy-((ind-ymin)*ysep)*10;
	
	// draw index data point
	if size != max_disp
		{
		var dir = -1;
		var col = draw_tee_marker(xpos-18,ypos-3,6,"black","",false); // draw dot
		
		draw_text_height(xpos-5,ypos+(30*dir),string_format(ind,2,1),25); // draw index
		}
	else // viewing all
		{
		var ww_off = xsep;
		var xoff = 0;
		
		if i == 0
			{
			var xoff = -100+xsep;
			ww_off = 100;
			}
		else if i+1 == pos_end
		var ww_off = 100;
		
		if click_region(xx+xoff+off_pos,yy-hh,ww_off,hh,true,mb_left,navbar.main)
			{
			var buf = 30;
			draw_line_pixel(xx+8+off_pos,yy-hh+buf,1,hh,c_gray,0.5);
			
			var col = draw_tee_marker(xpos-18,ypos-3,6,"black","",false);
			draw_text_height(xpos-40,yy-hh-60,"Ind: "+string_format(ind,2,1),25); // draw index
			draw_text_height(xpos-60,yy-hh-30,date_str,25,fn_italic); // draw date played
			}
		}

	// draw connecting line
	if i != pos_start
	draw_line_width_color(xprev-1,yprev,xpos,ypos,3,col,col);

	xprev = xpos;
	yprev = ypos;
	}
	
var col = c_white;
draw_rectangle_color(0,yy-hh,xx,yy+10,col,col,col,col,false);
	
// draw the graph outline
draw_line_width(xx,yy,xx+ww,yy,3); // hor axis
draw_line_width(xx,yy,xx,yy-hh,3); // vert axis

// draw tick marks
for(var i=0;i<ticks;i++)
	{
	var tick_ww = 1;
	
	if (i mod 10 == 0) // || (i == ticks-1)
		{
		tick_ww = 2;
		draw_text_height(xx-50,yy-10-(i*ysep),ymin+(i*0.1),20); // draw index
		
		draw_line_pixel(xx,yy-(i*ysep),ww,1,c_gray,0.5); // line across
		draw_line_pixel(xx-tick_ll,yy-1-(i*ysep),tick_ll*2,tick_ww,c_black,1); // tick marks
		}
	}
	
#region scrolling
var offset_start_pointer = [self,"index_trend_offset_start"];
var offset_pointer = [self,"index_trend_offset"];
var scrollbar_index = 0;
var xx = 0;
var sub = navbar.main;

funct_screen_scrolling_hor(0,yy-hh,room_width,hh,xsep,size,max_disp,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion
    
#region draw display type
var xx = 130;
var xsep = 200;
var ysep = 50;
var height = 40;

for(var i=0;i<2;i++)
	{
	var lt_yellow = make_color_rgb(255,253,217);
	var col = pick(c_white,lt_yellow,i==handicap_trend_type);
	var arr = ["Yearly","Max"];
		
	if click_button(xx+(i*xsep)-20,yy+20,arr[i],height,c_black,150,ysep,col,true,col==c_black,navbar.main)
		{
		handicap_trend_type = i;
		}
	}


//draw_text_height(xx+(0*xsep),yy+25,"Yearly",height);
//draw_text_height(xx+(1*xsep)+10,yy+25,"Max",height);
#endregion

}
