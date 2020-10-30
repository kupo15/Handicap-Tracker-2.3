/*
function draw_text_height_cursor(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {

	var xx = argument0;
	var yy = argument1;
	var xoff = argument2;
	var yoff = argument3;
	var str = argument4;
	var str_disp = argument5;
	var halign = argument6;
	var angle = argument7;
	var target = argument8;
	var debug_move = argument9;
	var ww = argument10; // cursor width
	var curs_col = argument11; // cursor color
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
		draw_line_width_color(xx+xoff,yy,xx+xoff,yy+hh,ww,curs_col,curs_col); // draw cursor
		draw_set_alpha(1);
		}


}
