
function draw_handicap_season() {

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
var hh = app_height-nav_height-yy;
var rows = hh/sep;
var height = 35;

var list_size = array_length(handicap_season_array);
var pos_start = floor(handicap_season_offset);
var pos_end = min(list_size,ceil(handicap_season_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-handicap_season_offset;	
	var off_pos = off_ind*sep;	
		
	var pointer = handicap_season_array[i];
	var state_name = pointer.stateName;
	
	draw_text_height(xx+xoff,yy+yoff+off_pos,state_name,height,fn_bold);
	
	var district_num = array_length(pointer.districts);
	var district_num = 1;
	for(var n=0;n<district_num;n++)
		{
		var ysep = 35;
		var ypos = yy+off_pos+height+5+(n*ysep);
		var district_pointer = pointer.districts[n];
		var district_name = district_pointer.districtName;
		
		draw_text_height_ext(xx+xoff,ypos+yoff,district_name,30,280,0,height*0.8); // draw district name

		if district_pointer.yearRound
		var season_str = "Year-Round";
		else
			{
			var start_month = date_get_month(district_pointer.startSeason);
			var month_str = funct_convert_month(start_month,false);
			var start_day = date_get_day(district_pointer.startSeason);
			var startDate_str = month_str+" "+string(start_day);

			var end_month = date_get_month(district_pointer.endSeason);
			var month_str = funct_convert_month(end_month,false);
			var end_day = date_get_day(district_pointer.endSeason);
			var endDate_str = month_str+" "+string(end_day);
			
			var season_str = startDate_str+"-"+endDate_str;
			}

		draw_text_height_color(360,ypos+10,season_str,c_gray,height*0.8,fn_italic); // draw season dates
		}
	
	draw_line_pixel(xoff,yy+off_pos,app_width,1,c_lt_gray,1);
	
	if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.hidden,i,handicap_season_array)
	{}
	}

#region scrolling
var xx = 0;
var sub = navbar.hidden;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);
#endregion

// draw the 3 bars
draw_screen_header(headerType.bars,headerType.none,"Golf Season");
	
if androidBack
screen_goto_prev(navbar.main);
}
