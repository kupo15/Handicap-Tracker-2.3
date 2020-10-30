/*
function click_region_pressed(argument0, argument1, argument2, argument3, argument4) {

	/// @param x
	/// @param y
	/// @param width
	/// @param height
	/// @param highlight

	var xx = argument0;
	var yy = argument1;
	var ww = argument2;
	var hh = argument3;
	var highlight = argument4;

	if mouse_check_button_pressed(mb_left)
	   {
	   mouse_xstart = mouse_x;
	   mouse_ystart = mouse_y;
	   mouse_xdist = 0;
	   mouse_ydist = 0;
	   }

	if (mouse_x > xx) && (mouse_x < xx+ww) && (mouse_y > yy) && (mouse_y < yy+hh)
	    {
	    draw_set_alpha(0.5)
	  //  draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_yellow,c_yellow,c_yellow,c_yellow,false);
	    draw_set_alpha(1);
    
	    if mouse_check_button_pressed(mb_left)
	    return true;
	    }
    
	return false;
}