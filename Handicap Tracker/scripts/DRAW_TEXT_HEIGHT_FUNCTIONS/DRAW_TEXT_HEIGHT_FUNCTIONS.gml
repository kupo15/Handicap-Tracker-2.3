
function draw_text_height() {
	/// @description  draw_text_height(x,y,string,height,[font]);
	/// @param x
	/// @param y
	/// @param string
	/// @param height
	/// @param [font]
	var xx = argument[0];
	var yy = argument[1];
	var str = argument[2];

	var wantSize = argument[3]; // height of text I want
	var currSize = string_height(str);
	var scale = wantSize / currSize;

	if argument_count > 4
	draw_set_font(argument[4]);
	else
	draw_set_font(fn_normal);

	draw_text_transformed(xx,yy,str,scale,scale,0); // this will draw at 64 pixels tall
	
	return scale;
}

function draw_text_height_ext(xx,yy,str,angle,sep,w,target) {

	var wantSize = target; // height of string I want
	var currSize = string_height(str); // current height of string
	var scale = wantSize/currSize;
	
	var sep_scale = sep/scale;
	w /= scale;

	draw_text_ext_transformed(xx,yy,str,sep_scale,w,scale,scale,angle);

	return scale;
}



function draw_text_height_ext_cursor(xx,yy,str,str_disp,angle,sep,str_ww,height,ind,cursor_ww,cursor_col,font) {

	// [optional arguments]
	if is_undefined(cursor_ww)
	cursor_ww = cursor_width;

	if is_undefined(cursor_col)
	cursor_col = cursor_color;
	
	if is_undefined(font)
	draw_set_font(fn_normal);
	else
	draw_set_font(font);

	// draw text
	var scale = draw_text_height_ext(xx,yy,str_disp,angle,sep,str_ww,height); // draw string
	var xoff = string_width(str)*scale; 
	var yoff = floor(xoff/str_ww); // cursor ypos
	var hh = height*0.9; // cursor height

	// don't draw cursor
	if textbox_index != ind || !kv_active
	exit;
	
	textboxStringScale = scale;
	textboxStringLength = string_length(str); // number of characters in string
	textboxStringWidth = string_width(str)*scale; // width of string in px

	var str_width_half = textboxStringWidth*0.5;
	var fa_mod = (draw_get_halign() == fa_center); // half width of string

	if fa_mod // if centered 
	cursorHoverPos = 1-abs(clamp((mouse_x-xx-str_width_half)/textboxStringWidth,-1,0)); // percentage in string mouse_x is (0 - 1)
	else
	cursorHoverPos = clamp((mouse_x-xx)/textboxStringWidth,0,1); // percentage in string mouse_x is (0 - 1)

	// if deleting a character
	if textboxStringLength < cursorPos
		{
		cursorPos = textboxStringLength;
		cursorPosStart = cursorPos;
		}
	else if string_length(kv_last_string) != string_length(keyboard_string) // if adding a character
		{
		var last_length = string_length(kv_last_string);
		cursorPos += textboxStringLength-last_length;
	
		if cursorPos < 0
		cursorPos = 0;
		}

	cursorXposOff = 0;
	for(var i=0;i<cursorPos;i++) // loop through character until cursor pos
		{
		var char_ = string_char_at(str,i+1);
		var char_width = string_width(char_)*scale;
	
		cursorXposOff += char_width; // add width to cursor position
		}
			
	if fa_mod // if centered
	cursorXposOff -= str_width_half;

	var blink = current_time mod (cursor_blink*2);
	blink = floor(blink/cursor_blink);

	// draw cursor
	if !blink
		{
		draw_set_alpha(0.5);
		//draw_line_width_color(xx+xoff_mod,yy+yoff_mod,xx+xoff_mod,yy+yoff_mod+hh,ww,cursor_col,cursor_col); // draw cursor
		draw_line_width_color(xx+cursorXposOff,yy+hh,xx+cursorXposOff,yy,cursor_ww,cursor_col,cursor_col); // cursor
		draw_set_alpha(1);
		}

}


function draw_text_height_cursor(xx,yy,xoffset,yoff,str,str_disp,halign,angle,target,debug_move,cursor_ww,cursor_col) {
	var hoff = 0.5;

	var scale = draw_text_height(xx,yy,str_disp,angle,target,debug_move); // draw string
	var xoff = (1+string_width(str))*scale;
	var hh = target*0.9; // cursor height

	if halign == fa_center
	xoff *= 0.5;

	var blink = current_time mod (cursor_blink*2);
	blink = floor(blink/cursor_blink);

	// draw cursor
	if !blink
		{
		draw_set_alpha(0.5);
		draw_line_width_color(xx+xoff,yy,xx+xoff,yy+hh,cursor_ww,cursor_col,cursor_col); // draw cursor
		draw_set_alpha(1);
		}


}

function draw_text_height_entry() {
/// @param x
/// @param y
/// @param string
/// @param height
/// @param halign
/// @param textbox_index
/// @param cursor_height
/// @param [font]

	var xx = argument[0];
	var yy = argument[1];
	var str = argument[2];

	var wantSize = argument[3]; // height of text I want
	var currSize = string_height(str);
	var scale = wantSize / currSize;

	var halign = argument[4];
	var ind = argument[5];
	var cursor_hh = argument[6];

	if argument_count > 7
	draw_set_font(argument[7]);
	else
	draw_set_font(fn_normal);

	// draw text string
	draw_text_transformed(xx,yy,str,scale,scale,0);

	// don't draw cursor
	if textbox_index != ind || !kv_active
	exit;

	if is_nan(scale) || is_infinity(scale)
	scale = 1;

	// draw cursor
	var xoff = (1+string_width(str))*scale;
	var hh = cursor_hh*0.9; // cursor height

	if halign == fa_center
	xoff *= 0.5;

	var blink = current_time mod (cursor_blink*2);
	blink = floor(blink/cursor_blink);

	// draw cursor
	if !blink
		{
		draw_set_alpha(0.5);
		draw_line_width_color(xx+5+xoff,yy,xx+5+xoff,yy+hh,cursor_width,cursor_color,cursor_color); // draw cursor
		draw_set_alpha(1);
		}




}


function text_reduce(str,ww,height) {

	if str == ""
	return height;

	var wantSize = height; // height of text I want
	var currSize = string_height(str);
	var scale = wantSize / currSize;

	var str_ww = string_width(str)*scale;  // current width
	var sca = ww/str_ww;

	if str_ww < ww // if current width is less than the limit
	return wantSize; // no change
	else
	return wantSize*sca;


}

function string_abbreviate(argument0, argument1, argument2, argument3) {
/// @param string
/// @param length
/// @param target_height
/// @param abbrev_string

	var str = argument0;
	var ll = argument1;
	var target = argument2;
	var abbre = argument3;
	var new_str = "";
	var str_ll = string_length(str); // number of charaters

	var wantSize = target; // height of text I want
	var currSize = string_height(str);
	var scale = wantSize / currSize;

	// loop through string
	for(var i=0;i<str_ll;i++)
	if string_width(new_str)*scale < ll 
	new_str += string_char_at(str,i+1);
	else
		{
		new_str += abbre;
		break;
		}

	return new_str;


}
