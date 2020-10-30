
function click_region(x_left,y_top,ww,hh,button,highlight) {

	var mx = mouse_x;
	var my = mouse_y;

	if mouse_check_button_pressed(mb_left)
	   {
	   mouse_xstart = mouse_x;
	   mouse_ystart = mouse_y;
	   }

	if (mx > x_left) && (mx < x_left+ww) && (my > y_top) && (my < y_top+hh)
	    {
	    if highlight != noone
	        {// highlight area			
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,highlight,highlight,highlight,highlight,false);
	        draw_set_alpha(1);
	        }
           
	    if mouse_check_button_pressed(button) || mouse_check_button(button) || button == noone
	        {
	        //if button != noone
	        //audio_play_sound(snd_tap0,0,0);
	        return true;
	        }
	    else 
	    return false;
	    }
	else return false;
}

function click_region_pressed(xx,yy,ww,hh,highlight) {

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

function click_region_released(x_left,y_top,ww,hh,highlight,sub) {
	
var mx = mouse_x;
var my = mouse_y;

if sub != submenu || !can_click
exit;

var button = mb_left;
var mouse_vis = mouse_check_button(button);

if (mx > x_left) && (mx < x_left+ww) && (my > y_top) && (my < y_top+hh)
	{
	// highlight area
	if os_type == os_windows
	    {
		var col = c_yellow;
		
	    draw_set_alpha(0.3);
	    draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,col,col,col,col,false);
	    draw_set_alpha(1);
	    }
		
	// clicked highlight
	if mouse_check_button_pressed(button) && highlight != noone
	scr_click_highlight_set(x_left+(ww*0.5),y_top,ww,hh,highlight,screen_index,noone);
           
	if (mouse_check_button_released(button) && abs(mouse_ydist) < 15 && abs(mouse_xdist) < 30) || button = noone
	    {
        
	//    if button != noone
	//    clicked = true;
	//	mouse_clear(mb_left);
	
		can_click = false;

	    return true;
	    }
	else 
	return false;
	}
else 
return false;
}

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
	    if os_type == os_windows
	        {
			var col = c_yellow;
		
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,ypos_clamp,x_left+ww,ypos_clamp+sep,col,col,col,col,false);
	        draw_set_alpha(1);
			
			/*
			var click_xx = click_highlight_xpos;
			var click_yy = click_highlight_ypos;
			var click_hh = click_highlight_height;
			var click_col = click_highlight_color;
			var click_ww = click_highlight_width*0.5;

			draw_set_alpha(0.4*click_highlight_alpha);
			draw_roundrect_color(click_xx-click_ww,click_yy,click_xx+click_ww,click_yy+click_hh,click_col,click_col,false); // draw highlight
			draw_set_alpha(1);*/
	        }
		
		// clicked highlight
		if mouse_check_button_pressed(button) && highlight != noone
		scr_click_highlight_set(x_left+(ww*0.5),y_top,ww,hh,highlight,screen_index);
           
		// clicked selection
	    if (mouse_check_button_released(button) && abs(mouse_ydist) < 10 && abs(mouse_xdist) < 30) || button = noone
	        {
	    /*    if button != noone
	        audio_play_sound(snd_tap,0,false);
        
	        if button != noone
	        clicked = true;*/
			
			scrollbar_index_scrolling = noone;

	        return true;
	        }
	    else 
	    return false;
	    }
	else return false;
}

function click_region_pressed_clamp(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,sub,ind) {
	
var mx = mouse_x;
var my = mouse_y;

if sub != submenu
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

button = mb_left;
var mouse_vis = mouse_check_button(button);

if (mx > x_left) && (mx < x_left+ww) && (my > ypos_clamp) && (my < ypos_clamp+sep)
	{
	//  if mouse_vis && os_type == os_windows
	if highlight != noone
	    {
		var col = c_yellow;
		
	    draw_set_alpha(0.3);
	    draw_rectangle_colour(x_left,ypos_clamp,x_left+ww,ypos_clamp+sep,col,col,col,col,false);
	    draw_set_alpha(1);
	    }
		
	// clicked highlight
	if mouse_check_button_pressed(button) && highlight != noone
	scr_click_highlight_set(x_left+(ww*0.5),y_top,ww,hh,highlight,screen_index);
           
	// clicked selection
	if (mouse_check_button_pressed(button) && abs(mouse_ydist) < 15 && abs(mouse_xdist) < 30) || button = noone
	    {
		/*if button != noone
	    clicked = true;*/
		
		click_highlight_index = ind;
		
		if can_click
	    return true;
	    }
	else 
	return false;
	}
else return false;
}

function clickout_region(xx,yy,ww,hh,highlight,_sub) {

	var tolerance = 5;
	xx -= tolerance;
	yy -=tolerance;
	ww +=tolerance*2;
	hh += tolerance*2;

	if submenu != _sub
	exit;

	if android_back || (can_click && !click_region(xx,yy,ww,hh,noone,highlight) && mouse_check_button_released(mb_left))
	return true;
	else
	return false;
}

function click_textbox_set(str,textbox_ind,kvInit,kvGo) {

keyboard_string = str;
kv_last_string = str;
textbox_index = textbox_ind; // set the textbox_index

vk_initiate(kvInit,kvGo); // popup keyboard
}

function ini_cursor_vars() {

	textboxStringScale = noone;
	textboxStringLength = 0;
	textboxStringWidth = 0;

	cursorSet = false;
	cursorSetIndex = 0;
	cursorPos = 0; // the actual cursor position in string
	cursorPosStart = 0; // the starting position
	cursorXposOff = 0; // the cursor xpos in pixels
	cursorHoverPos = 0;

}

function scr_cursor_position_set(str,scale) {

	if cursorSet
	cursorSetIndex ++;

	if cursorSetIndex < 2
	exit;

	// reset
	cursorSet = false;
	cursorSetIndex = 0;

	var str_length = 0;
	var str_clicked_pos = textboxStringWidth*cursorHoverPos; // xpos within string

	if cursorHoverPos == 0 // clicked before first text character
		{
		cursorPos = 0;
		cursorPosStart = 0;
		cursorXposOff = 0;
		exit;
		}
	else // somewhere in the middle
	for(var i=0;i<textboxStringLength;i++) // loop through characters in string
		{
		var char = string_char_at(str,1+i); // get this character	
		var char_width = string_width(char)*scale; // width of the character
	
		str_length += char_width*0.5; // add half width to string length
		if str_clicked_pos < str_length // if clicked point is before added character
			{
			cursorPos = i;
			cursorPosStart = cursorPos;
			cursorXposOff = str_length-(char_width*0.5);
			exit;
			}
		else str_length += char_width*0.5; // add the rest of the width
		}
	
	// set to the end
	cursorPos = textboxStringLength;
	cursorPosStart = cursorPos;
	cursorXposOff = textboxStringWidth;


}
