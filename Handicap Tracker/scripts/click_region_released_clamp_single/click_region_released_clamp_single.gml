/*
function click_region_released_clamp(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
/// @param x_left
/// @param y_top
/// @param yoffset
/// @param region_ww
/// @param sep
/// @param box_hh
/// @param ms_button
/// @param highlight
/// @param submenu

	var mx = mouse_x;
	var my = mouse_y;

	var x_left = argument0;
	var y_top = argument1;
	var yoff = argument2;
	var ww = argument3;
	var hh = argument4; // sep
	var box_hh = argument5;
	var button = argument6;
	var highlight = argument7;
	var sub = argument8;

	if sub != submenu || !can_click
	exit;

	// change yy and sep/hh
	var ypos = y_top+yoff;
	var ypos_clamp = clamp(ypos,y_top,y_top+box_hh); // clamp between window
	var sep_adj = abs(ypos-ypos_clamp); // remaining height after clamped
	var sep = hh-sep_adj;
		
	// if hanging off the bottom
	if ypos+sep > y_top+box_hh
	sep = y_top+box_hh-ypos;

	y_top += yoff; // top of selection

	var button = mb_left;
	var mouse_vis = mouse_check_button(button);

	if (mx > x_left) && (mx < x_left+ww) && (my > ypos_clamp) && (my < ypos_clamp+sep)
	    {
	  //  if mouse_vis && os_type == os_windows
	        {
			var col = c_yellow;
		
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,ypos_clamp,x_left+ww,ypos_clamp+sep,col,col,col,col,false);
	        draw_set_alpha(1);
	        }
		
		// clicked highlight
	//	if mouse_check_button_pressed(button) && highlight != noone
	//	scr_click_highlight_set(x_left+(ww*0.5),y_top,ww,hh,highlight);
           
		// clicked selection
	    if (mouse_check_button_released(button) && abs(mouse_ydist) < 15 && abs(mouse_xdist) < 30) || button = noone
	        {
	    /*    if button != noone
	        audio_play_sound(snd_tap,0,false);
        
	        if button != noone
	        clicked = true;
	        return true;
	        }
	    else 
	    return false;
	    }
	else return false;




}
