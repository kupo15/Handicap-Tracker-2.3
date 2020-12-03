
function draw_handicap_season() {

var return_val = undefined;

// set offsets
var scrollbar_index = offsetScroll.seasonOffset;
var handicap_season_offset = offsetArray[scrollbar_index];
var handicap_season_offset_start = offsetArrayStart[scrollbar_index];

// draw season
var xx = 0;
var yy = header_height;
var xoff = 30;
var yoff = 10;
var sep = 120;
var ww = app_width;
var hh = app_height-yy;
var rows = hh/sep;
var height = 35;

// expanding section
var district_exp = 0;
var district_ysep = 75;
var district_ratio = district_ysep/sep;

var list_size = array_length(handicap_season_array);
var pos_start = floor(handicap_season_offset);
var pos_end = min(list_size,ceil(handicap_season_offset)+rows);
var pos_start = 0;
var pos_end = list_size;
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-handicap_season_offset;	
	var off_pos = (off_ind*sep)+(district_exp*district_ysep);	
		
	var pointer = handicap_season_array[i];
	var state_name = pointer.stateName;

	draw_text_height(xx+xoff,yy+yoff+off_pos,state_name,height,fn_bold);
	
	var district_num = array_length(pointer.districts);
	//var district_num = 1;
	for(var n=0;n<district_num;n++)
		{
		var ysep = district_ysep;
		var ypos = yy+off_pos+height+5+(n*ysep);
		var district_pointer = pointer.districts[n];
		var district_name = district_pointer.districtName;
		
		draw_text_height_ext(xx+xoff,ypos+yoff,district_name,30,280,0,height*0.8); // draw district name

		if district_pointer.yearRound
		var season_str = "Year-Round";
		else
		var season_str = scr_handicap_season_date(district_pointer);

		draw_text_height_color(360,ypos+10,season_str,c_gray,height*0.8,fn_italic); // draw season dates

		if n>0
			{
			draw_line_pixel(70,ypos,app_width,1,c_lt_gray,1);
			district_exp ++;
			}
		
		if click_region_released_clamp_array(0,yy,off_pos+(n*ysep),ww,sep,hh,mb_left,c_yellow,submenu,i+(n*(1/district_num)),undefined)
		return_val = [pointer,n];
		}

	draw_line_pixel(xoff,yy+off_pos,app_width,1,c_lt_gray,1);
	}

#region scrolling
var xx = 0;
var sub = submenu;
list_size += district_exp*district_ratio;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);
#endregion

// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Golf Season");
	
if androidBack
	{
	if submenu == navbar.locationbar
	submenu = navbar.hidden;
	else
	screen_goto_prev(navbar.main);
	}

return return_val;
}
