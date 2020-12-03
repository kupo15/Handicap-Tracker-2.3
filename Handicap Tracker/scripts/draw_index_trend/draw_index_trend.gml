
function draw_index_trend() {

// set offsets
var scrollbar_index = offsetScroll.indexOffset;
var index_trend_offset = offsetArray[scrollbar_index];
var index_trend_offset_start = offsetArrayStart[scrollbar_index];

// draw trend
var xx = 60;
var yy = 610;
var ww = app_width-xx-30;
var hh = 400;
var ymin = 100; // lowest index number
var ymax = 0;
var tick_ll = 5; // tick length
var max_disp = 8; // indices at one time
var starting_pos = 0;

#region set the y axis
var size = array_length(included_scores_array);
var pos_end = clamp(size-starting_pos,0,size);
for(var i=0;i<pos_end;i++)
	{
	var score_pointer = included_scores_array[i];
	var index = score_pointer.handicapData.indexHistory;

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

if handicap_trend_type == trendType.indexMax
var max_disp = size;
		
// debug
//index_trend_offset += funct_mouse_wheel(1);
index_trend_offset = clamp(index_trend_offset,0,size-max_disp);
	
#region draw year stats
var height = 50;
var pos_start = floor(index_trend_offset+0.5)+starting_pos;
var score_pointer = included_scores_array[pos_start];
	
var round_pointer = score_pointer.roundData;
var date = round_pointer.roundDate; // get the date
var start_year = date_get_year(date);

var heading_str = pick(start_year,"All Data",size == max_disp);

// draw year
draw_set_halign(fa_center);
draw_text_height(app_width*0.5,yy-hh-height-60,heading_str,height,fn_bold);
draw_set_halign(fa_left);
#endregion	
	
#region draw the hor trends
var col = c_black;
var xsep = (ww-8)/(min(size,max_disp)-1);
var xprev = xx;
var yprev = yy-500;
var curr_year = start_year;

var pos_start = floor(index_trend_offset)+starting_pos;
var pos_end = min(pos_start+max_disp+1,size);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-index_trend_offset-starting_pos;
	var off_pos = off_ind*xsep;
	var n = i;
	
	// root data
	var score_pointer = included_scores_array[n];
	
	var round_pointer = score_pointer.roundData;
	var date = round_pointer.roundDate; // get the date
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_str = string(funct_convert_date(month,false,noone,noone))+" "+string(day)+", "+string(year);
		
	// tee data
	var tee_pointer = score_pointer.teeData;
	var handicap_pointer = score_pointer.handicapData;

	// handicap data
	var ind = handicap_pointer.indexHistory; // get the index
	var teeColor = tee_pointer.teeColor;
	
	var xpos = xx+15+off_pos;
	var ypos = yy-((ind-ymin)*ysep)*10;
	
	// draw index data point
	if size != max_disp
		{
		var dir = -1;
		var col = draw_tee_marker(xpos-18,ypos-3,6,"black","",false); // draw dot
		
		draw_text_height(xpos-15,ypos+(30*dir),string_format(ind,2,1),25); // draw index
		
		if year > curr_year
			{
			var label_xpos = xpos-(xsep*0.5);

			if label_xpos > xx
				{
				draw_line_pixel(label_xpos,yy,1,-hh,c_gray,1);	
				draw_text_height(label_xpos-20,yy-hh-25,year,25);
				}
			
			curr_year = year;
			}
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
		
		if point_in_rectangle(mouse_x,mouse_y,xx+xoff+off_pos,yy-hh,xx+xoff+off_pos+ww_off,yy)
		&& mouse_check_button(mb_left)
		//if click_region(xx+xoff+off_pos,yy-hh,ww_off,hh,true,mb_left,navbar.main)
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
#endregion	
	
#region draw the graph outline
var col = c_white;
draw_rectangle_color(0,yy-hh,xx,yy+10,col,col,col,col,false);
	
draw_line_width(xx,yy,xx+ww+100,yy,3); // hor axis
draw_line_width(xx,yy,xx,yy-hh,3); // vert axis

// draw tick marks
for(var i=0;i<ticks;i++)
	{
	var tick_ww = 1;
	
	if (i mod 10 == 0) // || (i == ticks-1)
		{
		tick_ww = 2;
		draw_text_height(xx-50,yy-10-(i*ysep),ymin+(i*0.1),20); // draw index
		
		draw_line_pixel(xx,yy-(i*ysep),ww+100,1,c_gray,0.5); // line across
		draw_line_pixel(xx-tick_ll,yy-1-(i*ysep),tick_ll*2,tick_ww,c_black,1); // tick marks
		}
	}
#endregion
	
#region scrolling
var xx = 0;
var sub = navbar.main;

if handicap_trend_type == trendType.indexYearly
funct_screen_scrolling_hor(0,yy-hh,app_width,hh,xsep,size,max_disp,scrollbar_index,sub);
#endregion	
	
#region draw display type
var xx = 130;
var xsep = 200;
var ysep = 50;
var height = 40;
var trend_type = handicap_trend_type;

for(var i=0;i<2;i++)
	{
	var lt_yellow = make_color_rgb(255,253,217);
	var col = pick(c_white,lt_yellow,i==handicap_trend_type);
	var arr = ["Yearly","Max"];
		
	if click_button(xx+(i*xsep)-20,yy+20,arr[i],height,c_black,150,ysep,col,true,col==c_white,navbar.main)
	handicap_trend_type = i;
	}
#endregion	
	
#region draw year data below

xx = 30
yy += 180;

// draw year
draw_text_height(xx,yy+(-1.5*height),heading_str,50,fn_bold);

// draw data
var sep = 40;
var height = 35;

draw_set_halign(fa_left);
draw_text_height(xx,yy+(0*sep),"Rounds Played:",height);
draw_text_height(xx,yy+(1*sep),"Season Starting Index:",height);
draw_text_height(xx,yy+(2*sep),"Season Ending Index:",height);
draw_text_height(xx,yy+(3*sep),"Season Index Change:",height);
	
var rounds_played_str = 0;
var start_index_set = false;
var start_index = "N/A";
var end_index = "N/A";
var change_index = "N/A";	

for(var i=0;i<size;i++)
	{
	var score_pointer = included_scores_array[i];
	
	var handicap_pointer = score_pointer.handicapData;
	var index = handicap_pointer.indexHistory;

	var round_pointer = score_pointer.roundData;
	var date = round_pointer.roundDate; // get the date
	var year = date_get_year(date);

	// if in the year viewing
	if (year == start_year) || (trend_type == trendType.indexMax)
		{
		rounds_played_str ++; // set rounds played

		// set start index	
		if !start_index_set
			{
			start_index = string_format(index,1,1);
			start_index_set = true;
			}
			
		// set end index
		end_index = string_format(index,1,1);
		change_index = real(end_index)-real(start_index);
		}
	}
	
var change_col = c_black;

if is_real(change_index)
	{
	var red = make_color_rgb(170,15,20);	
	var green = make_color_rgb(20,170,80);
	var change_col = pick(green,red,sign(change_index) == 1);
	change_index = string_format(change_index,1,1);
	}
	
xx = 350;

draw_text_height(xx,yy+(0*sep),rounds_played_str,height);
draw_text_height(xx,yy+(1*sep),start_index,height);
draw_text_height(xx,yy+(2*sep),end_index,height);
draw_text_height_color(xx,yy+(3*sep),change_index,change_col,height);

if change_col != c_black
	{
	var xoff = string_width_height(change_index,height)+5;
	draw_menu_triangle(xx+xoff,yy+13+(3*sep),10,sign(real(change_index)) != 1,change_col);
	}
#endregion
	


}
