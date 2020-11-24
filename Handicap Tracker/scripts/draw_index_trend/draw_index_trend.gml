/// @param x
/// @param y
/// @param ww_hh
/// @param ymin
/// @param ymax
function draw_index_trend() {

var xx = 60;
var yy = 750;
var ww = 425;
var hh = 350;
var ymin = 100; // lowest index number
var ymax = 0;
var tick_ll = 4; // tick length
var max_disp = 8; // indices at one time

// set the y axis
var size = array_length(scorelist_array);
for(var i=0;i<size;i++)
	{
	var score_pointer = scorelist_array[i];
	var ind = score_pointer.indexHistory;

	if (ind == undefined) || score_pointer.practiceRound
		{
		size = i; // cull out unknown indexs
		break;
		}
	
	if ind < ymin
	ymin = ind;
	
	if ind > ymax
	ymax = ind;
	}

ymin = max(ymin-2,0);
ymax += 1;

var ticks = (ymax-ymin)*10;
var ysep = hh/ticks;

if handicap_trend_type == 1
var max_disp = size;
		
index_trend_offset += funct_mouse_wheel(1);
index_trend_offset = clamp(index_trend_offset,0,size-max_disp);
	
// draw the hor trends
var col = c_black;
var xsep = ww/min(size,max_disp);
var xprev = xx;
var yprev = yy-500;
var pos_start = floor(index_trend_offset);
var pos_end = min(pos_start+max_disp,size);
//sm(index_trend_offset)
//sm(pos_start)
//sm(pos_end);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_pos = i-index_trend_offset;
	var n = size-1-i;
	
	var pointer = scorelist_array[n];
	//sm(n)
	//sm(pointer)
	var ind = pointer.indexHistory; // get the index
	var teeColor = pointer.teeColor;
	
	var xpos = xx+8+(i*xsep)-(index_trend_offset*xsep);
	var ypos = yy-((ind-ymin)*ysep)*10;
	
	var date = pointer.roundDate; // get the date
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_str = string(funct_convert_date(month,false,noone,noone))+" "+string(day)+", "+string(year);
	
	// draw index data point
	if size != max_disp
		{
		var dir = -1;
		var col = draw_tee_marker(xpos,ypos,5,"black","",false); // draw dot
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
		
		if click_region(xx+xoff+(i*xsep),yy-hh,ww_off,hh,mb_left,noone)
			{
			var buf = 30;
			draw_line_pixel(xx+8+(i*xsep),yy-hh+buf,1,hh,c_gray,0.5);
			
			var col = draw_tee_marker(xpos,ypos,5,"black","",false);
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
		tick_ww = 3;
		draw_text_height(xx-50,yy-10-(i*ysep),ymin+(i*0.1),20); // draw index
		draw_line_pixel(xx,yy-(i*ysep),ww,1,c_gray,0.5); // line across
		}
		
	draw_line_pixel(xx-tick_ll,yy-1-(i*ysep),tick_ll*2,tick_ww,c_black,1); // tick marks
	}
	
#region scrolling
var offset_start_pointer = [self,"index_trend_offset_start"];
var offset_pointer = [self,"index_trend_offset"];
var scrollbar_index = 0;
var xx = 0;
var sub = navbar.main;

funct_screen_scrolling_hor(0,yy-hh,room_width,hh,xsep,size,max_disp,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion
    
// draw display type
var xx = 130;
var xsep = 200;
var ysep = 50;
var height = 40;

draw_set_alpha(0.3);
for(var i=0;i<2;i++)
	{
	var col = c_black;
	if i==handicap_trend_type
	col = c_yellow;
	
	draw_roundrect_color(xx+(i*xsep)-20,yy+20,xx+(i*xsep)-20+150,yy+20+ysep,col,col,col==c_black);
	
	if click_region(xx+(i*xsep)-20,yy+20,150,ysep,mb_left,c_yellow)
		{
		handicap_trend_type = i;
		}
	}
draw_set_alpha(1);


draw_text_height(xx+(0*xsep),yy+25,"Yearly",height);
draw_text_height(xx+(1*xsep)+10,yy+25,"Max",height);


}
