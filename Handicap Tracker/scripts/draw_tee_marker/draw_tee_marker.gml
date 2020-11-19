
function draw_tee_marker(xx,yy,hh,teeColor,str,enclosed) {
/// @param x
/// @param y
/// @param height
/// @param teeboxColor
/// @param tee_string
/// @param enclosed

if argument[4] == undefined
str = "";

var tee_str_col = make_color_rgb(38,72,106);
var outline = false;
var height = hh*0.83;
var radius = hh*0.2;
var circle_yoff = hh*0.5;
var ww = string_width_height(str,height)+50;

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
				  draw_roundrect_color_ext(xx,yy,xx+ww,yy+hh,height,hh,bg_col,bg_col,true);

				  draw_text_height_middled_color(xx+40,yy,str,hh,tee_str_col,height); // draw slope/rating

				  draw_circle_color(xx+18,yy+circle_yoff,radius,c_black,c_black,true); // marker circle
				  
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
draw_roundrect_color_ext(xx,yy,xx+ww,yy+hh,height,hh,bg_col,bg_col,false); // background

// draw string
draw_text_height_middled_color(xx+40,yy,str,hh,tee_str_col,height); // draw slope/rating
	
// draw tee circle
draw_circle_color(xx+18,yy+circle_yoff,radius,col,col,outline); // marker circle

return col;
}
