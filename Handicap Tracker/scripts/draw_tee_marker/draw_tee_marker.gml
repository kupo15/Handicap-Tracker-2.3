/// @param x
/// @param y
/// @param radius
/// @param teebox_index
function draw_tee_marker(xx,yy,rr,ind) {

	var outline = false;

	switch ind
		{
		case tee_marker.green: var col = c_green; break; // green
		case tee_marker.red: var col = c_red; break; // red
	
		case tee_marker.white: var col = make_color_rgb(220,220,220); // white
							   draw_circle_color(xx,yy,rr,c_black,c_black,true);
							   return col;
							   break;
				
		case tee_marker.blue: var col = make_color_rgb(0,0,160); break; // blue
		case tee_marker.gold: var col = make_color_rgb(171,160,0); break; // gold
		case tee_marker.black: var col = c_black; break; // black
		}
	
	draw_circle_color(xx,yy,rr,col,col,outline);

	return col;


}
