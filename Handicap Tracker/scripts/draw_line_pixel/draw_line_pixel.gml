/// @param xx
/// @param yy
/// @param length
/// @param width
/// @param col
/// @param alpha
function draw_line_pixel(argument0, argument1, argument2, argument3, argument4, argument5) {

	var xx = argument0;
	var yy = argument1;
	var ww = argument2;
	var hh = argument3;
	var col = argument4;
	var alpha = argument5;

	draw_sprite_ext(spr_pixel,0,xx,yy,ww,hh,0,col,alpha);


}
