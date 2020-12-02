function draw_stats() {
	
// set offsets
var scrollbar_index = offsetScroll.statsOffset;
var stats_offset = offsetArray[scrollbar_index];
var stats_offset_start = offsetArrayStart[scrollbar_index];	
	
var stat_struct = statslist_array[stat_index];
var stat_tee_pointer = stat_struct.teeData;
	
#region draw course and tee
var xx = 20;
var yy = 100;
var ww = app_width;
var sep = 130;
var height = 60;

var condition = array_length(statslist_array) == 0;
var course_name = pick(stat_struct.courseName,"No Courses",condition);
var course_height = text_reduce(course_name,ww-60,height);

draw_text_height(xx,yy,"Course",height*0.6,fn_italic); // draw course name label
draw_text_height(xx,yy+40,course_name,course_height); // draw course name

if click_region_released(0,yy-10,ww,sep,true,navbar.main)
	{
	popup_coursebar();
	mouse_clear(mb_left);
	}
#endregion

#region find score range
var xx = 60;
var yy = 620
var ww = 400;
var ymin = 50;
var ymax = 50;

var list_size = 0;
var names = variable_struct_get_names(stat_tee_pointer);
var size = array_length(names);
for(var i=0;i<size;i++) // loop through tee colors
	{		
	var pointer = variable_struct_get(stat_tee_pointer,names[i]);	
	var list_size = array_length(pointer); // number of scores
			
	// loop through all scores to find the max
	for(var n=0;n<list_size;n++) 
		{
		var _score = pointer[n].netScore; // score
		
		if _score > ymax
		ymax = _score;
		}
	}

ymax += 5; // add a buffer to the top

var ticks = ymax-ymin; // number of tick marks
var ysep = ww/ticks;
#endregion



#region draw graph
var col = c_white;
draw_rectangle_color(0,yy-ww,xx,yy+10,col,col,col,col,false);

draw_line_width(xx,yy,xx+ww,yy,3); // hor axis
draw_line_width(xx,yy,xx,yy-ww,3); // vert axis

// draw tick marks
var tick_ll = 4;
for(var i=0;i<ticks;i++)
	{
	var tick_ww = 1;
	if (i mod 10 == 0) //|| (i == ticks-1)
		{
		tick_ww = 2;
		draw_text_height(xx-30,yy-10-(i*ysep),50+i,20); // draw score
		}
		
	draw_line_width(xx-tick_ll,yy-(i*ysep),xx+tick_ll,yy-(i*ysep),tick_ww); // tick marks
	}
#endregion
exit






	
var can_select = true;
var tee_ind = 0;
var size = ds_list_size(teebox_list);
for(var i=0;i<size;i++)
if !ds_list_empty(stat_tee[i]) // if there is data in the list
	{
	// draw the tee available
	var tee_xx = xx+10;
	var tee_yy = yy+15;
	var tee_ysep = 45;
	var tee_str = teebox_list[| i];

	draw_tee_marker(tee_xx,tee_yy+(tee_ind*tee_ysep),tee_ysep,tee_str,tee_str,false);
	
	// select tee
	if can_select
		{
		if click_region_released(0,tee_yy+(tee_ind*tee_ysep),app_width,tee_ysep,true,navbar.main)
			{
			stat_tee_index = i;
			can_select = false;
			}
		}
	
	tee_ind ++;
	}
	
var max_disp = 10;
var xsep = 0;

var size = ds_list_size(teebox_list);
for(var i=0;i<size;i++)
if !ds_list_empty(stat_tee[i]) // if there is data in the list
	{		
	if stat_tee_index == noone
	var alph = 1;
	else
	var alph = 0.15+((stat_tee_index==i)*0.85);
	
	draw_set_alpha(alph);
	
	// draw the line graph
	var score_num = ds_list_size(stat_tee[i]); // number of scores
	var xsep = ww/min(score_num,max_disp);
	var xprev = xx;
	var yprev = yy-500;
	
	var disp_start = floor(stats_offset);
	var disp_end = min(score_num,ceil(stats_offset)+max_disp);
	for(var n=disp_start;n<disp_end;n++)
		{
		var _score = ds_list_find_value(stat_tee[i],n); // score
		var xpos = xx+8+(n*xsep)-(stats_offset*xsep);
		var ypos = yy-((_score-ymin)*ysep);
		var tee_col = teebox_list[| i];

		var col = draw_tee_marker(xpos-18,ypos-3,5,tee_col,"",false);
		
		if (stat_tee_index != noone) && (i == tee_marker.white)
		col = c_black;
		
		if n > stats_offset
		draw_line_width_color(xprev,yprev,xpos,ypos,3,col,col);
		
		var dir = 1;
		if yprev > ypos
		dir = -1;
		
		if stat_tee_index == i
		draw_text_height(xpos+5,ypos+(20*dir),_score,25); // draw scores
		
		xprev = xpos;
		yprev = ypos;
		}
	}
draw_set_alpha(1);
	
#region scrolling
var xx = 0;
var yy = 220;
var hh = 400;
var sub = navbar.main;

funct_screen_scrolling_hor(0,yy,app_width,hh,xsep,list_size,max_disp,scrollbar_index,sub);
#endregion
    
if draw_submenu_course_search(header_height,app_width,90,courselist_array,offsetScroll.courselistOffset)
	{
	submenu = navbar.main;
	course_struct = returnedSearch;
	
	stat_index = searchedIndex;
	stat_tee_index = noone;

	scr_stats_set();
	}	

// draw header
draw_screen_header(headerType.back,headerType.none,"Course Stats");

// unselect tee
if can_select
	{
	if click_region_released(0,0,app_width,800,noone,navbar.main) // mouse_check_button_released(mb_left)
	stat_tee_index = noone;
	}

if androidBack
&& !kvActive
	{
	if submenu >= 0
	submenu = navbar.main;
	}

}
