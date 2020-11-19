function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}


function draw_home() {

// draw the 3 bars
draw_screen_header(headerType.bars,headerType.none,"Home");
	
// draw Handicap Index
var xx = app_width/2;
var yy = 140;
var height = 40;

if is_nan(ghin_index)
var str = "N/A";
else
var str = string_format(ghin_index,1,1);

draw_set_halign(fa_center);
draw_text_height(xx,yy,"Index",height);
draw_text_height(xx,yy+30,str,height*3);
draw_set_halign(fa_left);
	
// var half = 70;
// draw_rectangle(xx-half,yy+210,xx+half,yy+210+10,true);

// clicked on index
if click_region_released(165,150,235,150,true,navbar.main)
	{
	scr_trend_set();
	exit;
	}
	

// draw rounds played
var xx = 20;
var yy = 350;
var height = 60;

draw_text_height(xx,yy,"Rounds Played: "+string(rounds_played),height);

// draw round falling off
draw_falling_off(10,800);
}
