/// @param x
/// @param y
/// @param rows
/// @param yoff
/// @param asset_num
/// @param scroll_ww
/// @param offset_var
/// @param ysep
/// @param width_off
/// @param color
/// @param scrollbar_index
function funct_draw_scrollbar(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {

	var ww = argument8;
	var ysep = argument7;
	var _offset = argument6;
	var xx = argument0;
	var yy = argument1;
	var row = argument2; // max fit in box
	var yyoff = argument3; // space for a header
	var hh = (row*ysep)+yyoff; // height of dialog box
	var asset_num = argument4; // number of assets
	var asset_ratio = clamp((row/asset_num),0,1);
	var offset_max = asset_num-(row);
	var scroll_ww = argument5; // width of scroll bar
	var scroll_hh = (hh-yyoff)*asset_ratio; // height of scroll bar
	var scroll_ratio = _offset/offset_max ; // position in offset
	var scroll_yy = yy+yyoff+((hh-yyoff)*scroll_ratio*(1-asset_ratio)); // ypos start of scroll
	var col = argument9;
	var scrollbar_index = argument10;

	/*if scr_mouse_position(xx+ww-scroll_ww,scroll_yy,xx+ww,scroll_yy+scroll_hh,mb_left,false) // click on scroll bar
	scrollbar_ystart = device_mouse_y_to_gui(0); // get starting position on scroll bar
	else if mouse_check_button_released(mb_left)
	scrollbar_ystart = noone;

	if scrollbar_ystart != noone
	    {
	    scr_mouse_distance_gui();
	    var drag_ratio = (scrollbar_ystart+mouse_ydist_gui)/(hh-yyoff);
	    }*/
    
	
	
	if asset_num > row    
		{
		draw_set_alpha(0.5);
		draw_roundrect_color(xx+ww-scroll_ww,yy,xx+ww,yy+hh,col,col,false); // draw scroll background
	
		draw_set_alpha(scrollbar_disp[scrollbar_index]);
		draw_roundrect_color(xx+ww-scroll_ww,scroll_yy,xx+ww,scroll_yy+scroll_hh,col,col,false); // draw scroll bar
		}
	draw_set_alpha(1);



}
