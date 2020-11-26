function draw_active_round(xx,yy) {

var rows = 1;
var sep = 100;
var ww = app_width;
var hh = rows*sep;
var height = 40;
var col = make_color_rgb(232,237,255);

draw_text_height(xx+10,yy-50,"Active Round",50,fn_italic);

// if clicked
if click_region_released(0,yy-50,ww,sep+50,c_yellow,navbar.main)
screen_change(screen.playing);
}