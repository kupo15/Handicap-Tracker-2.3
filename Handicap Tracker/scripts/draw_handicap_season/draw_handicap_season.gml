
function draw_handicap_season() {

var xx = 0;
var xoff = 30;
var yy = header_height;
var sep = 100;
var ww = app_width;
var hh = app_height-nav_height-yy;
var rows = hh/sep;
var height = 30;

var list_size = array_length(handicap_season_array);
var pos_start = floor(handicap_season_offset);
var pos_end = min(list_size,ceil(handicap_season_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-handicap_season_offset;	
	var off_pos = off_ind*sep;	
		
	var pointer = handicap_season_array[i];
	var state_name = pointer.stateName;
	
	draw_text_height(xx+xoff,yy+10+off_pos,state_name,height,fn_bold);
	
	var district_num = array_length(pointer.districts);
	
	draw_line_pixel(xoff,yy+off_pos,app_width,1,c_lt_gray,1);
	
	if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.main,i,handicap_season_array)
	{}
	}

#region scrolling
var offset_start_pointer = [self,"handicap_season_offset_start"];
var offset_pointer = [self,"handicap_season_offset"];
var scrollbar_index = 0;
var xx = 0;
var sub = navbar.main;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion

// draw the 3 bars
draw_screen_header(headerType.bars,headerType.none,"Golf Season");
	
}
