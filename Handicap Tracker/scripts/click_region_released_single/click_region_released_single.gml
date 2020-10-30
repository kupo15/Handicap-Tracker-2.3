 /*function click_region_released(argument0, argument1, argument2, argument3, argument4, argument5) {

	/// @param x_left
	/// @param y_top
	/// @param box_ww
	/// @param box_hh
	/// @param highlight
	/// @param submenu


	var mx = mouse_x;
	var my = mouse_y;

	var x_left = argument0;
	var y_top = argument1;
	var ww = argument2;
	var hh = argument3;
	var highlight = argument4;
	var sub = argument5;

	if sub != submenu || !can_click
	exit;

	var button = mb_left;
	var mouse_vis = mouse_check_button(button);

	if (mx > x_left) && (mx < x_left+ww) && (my > y_top) && (my < y_top+hh)
	    {
		// highlight area
	    if highlight && (mouse_vis || (os_type == os_windows))
	        {
			var col = c_yellow;
		
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,col,col,col,col,false);
	        draw_set_alpha(1);
	        }
		
		// clicked highlight
	//	if mouse_check_button_pressed(button) && highlight != noone
	//	scr_click_highlight_set(x_left+(ww*0.5),y_top,ww,hh,highlight);
           
	    if (mouse_check_button_released(button) && abs(mouse_ydist) < 15 && abs(mouse_xdist) < 30) || button = noone
	        {
        
	    //    if button != noone
	    //    clicked = true;
			mouse_clear(mb_left);
	        return true;
	        }
	    else 
	    return false;
	    }
	else 
	return false;




}
