/// @param x
/// @param y
/// @param radius
/// @param teeboxColor
function draw_tee_marker(xx,yy,rr,teeColor) {

var outline = false;

switch string_lower(teeColor)
	{
	case "green": var col = c_green; break; // green
	case "red": var col = c_red; break; // red
	
	case "white": var col = make_color_rgb(220,220,220); // white
							draw_circle_color(xx,yy,rr,c_black,c_black,true);
							return col;
							break;
				
	case "blue": var col = make_color_rgb(0,0,160); break; // blue
	case "gold": var col = make_color_rgb(171,160,0); break; // gold
	case "black": var col = c_black; break; // black
	}
	
draw_circle_color(xx,yy,rr,col,col,outline);

return col;


}
