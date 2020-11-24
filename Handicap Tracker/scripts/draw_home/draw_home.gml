function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}


function draw_home() {

// draw the 3 bars
draw_screen_header(headerType.bars,headerType.none,"Home");
	
#region draw Handicap Index
var xx = app_width/2;
var yy = 110;
var height = 40;

var str = if_undef(string_format(ghin_index,1,1),"N/A");

draw_set_halign(fa_center);
draw_text_height(xx,yy,"Index",height);
draw_text_height(xx,yy+30,str,height*3);
draw_set_halign(fa_left);
	
// clicked on index
if click_region_released(0,header_height,app_width,330-header_height,true,navbar.main)
scr_trend_set();
#endregion

#region draw rounds played
var xx = 20;
var yy = 330;
var height = 35;

draw_line_pixel(0,yy,app_width,1,c_gray,1);
draw_text_height(xx,yy-height,"Rounds Played: "+string(rounds_played),height);
#endregion

// draw round falling off
draw_falling_off(10,830);
}
