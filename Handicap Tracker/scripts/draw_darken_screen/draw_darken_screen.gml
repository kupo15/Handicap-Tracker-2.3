function draw_background_screen() {

// draw background
var col = c_white;
draw_rectangle_color(0,0,room_width,room_height,col,col,col,col,false); // darken background

}

function draw_darken_screen(){
	
// draw darken screen
// var col = merge_color(c_white,c_black,darken_screen);
var col = c_black;

draw_set_alpha(screen_darken_alpha*0.5);	
draw_rectangle_color(0,0,room_width,room_height,col,col,col,col,false); // darken background
draw_set_alpha(1);
}