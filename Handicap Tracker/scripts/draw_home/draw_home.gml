function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}

function draw_home() {

// draw the 3 bars
draw_screen_header(headerType.bars,headerType.none,"Home");
	
draw_icon_width(spr_home_course,0,header_height,app_width,1);	
	
#region draw Handicap Index
var xx = app_width/2;
var yy = 110;
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
if click_region_released(0,header_height,app_width,330-header_height,true,navbar.main)
	{
	scr_trend_set();
	screen_change(screen.indexTrend);
	}
#endregion

#region draw rounds played
var xx = 20;
var yy = 330;
var height = 35;

draw_line_pixel(0,yy,app_width,1,c_gray,1);
draw_text_height_color(xx,yy-height,"Rounds Played: "+string(rounds_played),c_white,height);
#endregion

// draw

// draw round falling off
draw_falling_off(10,830);
}
