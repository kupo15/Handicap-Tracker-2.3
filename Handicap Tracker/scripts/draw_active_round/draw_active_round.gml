function draw_active_round(xx,yy) {

var ww = app_width;
var hh = 150;
var height = 40;
var col = make_color_rgb(232,237,255);

// header
draw_text_height(xx+10,yy-50,"Active Round",50,fn_italic);

// playing information
var course_name = active_course_struct.courseName;

draw_text_height(xx,yy,course_name,height); // course name


// if clicked
if click_region_released(0,yy-50,ww,hh+50,c_yellow,navbar.main)
scr_navbar_click(screen.playing);
}