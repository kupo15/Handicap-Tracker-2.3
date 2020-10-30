/// @param xx
/// @param yy
/// @param width
/// @param height
/// @param [round]
function draw_textbox() {

	var xx = argument[0];
	var yy = argument[1];
	var ww = argument[2];
	var hh = argument[3];
	var rounded = false;

	if argument_count == 5
	var rounded = argument[4];

	var col = make_color_rgb(232,236,255);

	if rounded
	draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
	else
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);


}
