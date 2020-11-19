
function draw_tee_marker(xx,yy,hh,teeColor,str,enclosed) {
/// @param x
/// @param y
/// @param height
/// @param teeboxColor

var tee_str_col = make_color_rgb(38,72,106);
var outline = false;
var ww = 240;

switch string_lower(teeColor)
	{
	case "green": var col = c_green;
				  var bg_col = make_color_rgb(200,252,188);
				  break;
	
	case "red": var col = c_red;
				var bg_col = make_color_rgb(253,208,208);
				break;
	
	case "white": var col = make_color_rgb(220,220,220);
				  var bg_col = c_black; // make_color_rgb(255,243,232);
	
				  if enclosed
				  draw_roundrect_color_ext(xx,yy,xx+ww,yy+hh,hh*0.83,hh,bg_col,bg_col,true);

				  draw_text_height_middled_color(xx+40,yy,str,hh,tee_str_col,hh*0.83); // draw slope/rating

				  draw_circle_color(xx+18,yy+13,hh*0.2,c_black,c_black,true);
				  
				  return col;
				  break;
				
	case "blue": var col = make_color_rgb(0,0,160); 
				 var bg_col = make_color_rgb(232,237,255);
				 break;
				 
	case "gold": var col = make_color_rgb(171,160,0);
				 var bg_col = make_color_rgb(231,230,205);
				 break;
	
	case "black": var col = c_black;
 				  var bg_col = make_color_rgb(210,210,210);
				  break;
	}
	
// draw enclosed
if enclosed
draw_roundrect_color_ext(xx,yy,xx+ww,yy+hh,hh*0.83,hh,bg_col,bg_col,false); // background

// draw string
draw_text_height_middled_color(xx+40,yy,str,hh,tee_str_col,hh*0.83); // draw slope/rating
	
// draw tee circle
draw_circle_color(xx+18,yy+13,hh*0.2,col,col,outline);

return col;
}
