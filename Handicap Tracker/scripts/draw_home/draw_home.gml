function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}

function draw_home() {
	
var yy = header_height-1;
var hh = draw_icon_width(spr_home_course,0,header_height-1,app_width,1);	

draw_line_pixel(0,yy+hh,app_width,1,c_gray,1);

// draw rounds played
var xx = 20;
var height = 35;

draw_text_height_color(xx,yy+hh-height,"Rounds Played: "+string(rounds_played),c_white,height);
	
// draw header
draw_screen_header(headerType.bars,headerType.none,"Home");	
	
#region draw Handicap Index
var xx = app_width/2;
var yy = header_height+30;
var height = 40;

if ghin_index == undefined
var str = "N/A";
else
var str = string_format(ghin_index,1,1);

draw_set_halign(fa_center);
draw_text_height_color(xx,yy,"Index",c_white,height);
draw_text_height_color(xx,yy+30,str,c_white,height*3);
draw_set_halign(fa_left);

// clicked on index
if click_region_released(0,header_height,app_width,hh,true,navbar.main)
	{
	scr_trend_set();
	screen_change(screen.indexTrend);
	}
#endregion

// draw active round
draw_active_round(20,500);

// draw round falling off
draw_falling_off(20,830);

// debug
if multiTouch[3]
	{
	var col = c_white;
	debugyoff = 0;

	draw_rectangle_color(0,0,app_width,500,col,col,col,col,false);
	debug_device_info(20,0,0,30,30);
	}
}
