function draw_overlay_roundtype(round_type) {
	
var roundtype_yoff = offsetArray[offsetScroll.roundtypeYoff];
var alph = (roundtype_yoff/1);
var col = c_black;

draw_set_alpha(alph*0.6);
draw_rectangle_color(0,0,app_width,app_height,col,col,col,col,false);

draw_set_alpha(alph);

var rows = 3;
var sep = 90;
var ww = app_width;
var hh = rows*sep;
var xx = 0;
var yy = 760-(hh*roundtype_yoff);
var height = 40;

var col = c_white;

draw_set_halign(fa_left);
draw_roundrect_colour(-1,yy,xx+ww,yy+hh,col,col,false);

var return_value = undefined;
for(var i=0;i<rows;i++)
	{	
	var off_pos = i*sep;
	var ypos = yy+off_pos;
	var str_arr = ["Fun Round","Normal Round","Tournament Round"];
	
	draw_text_height_middled(xx+25,ypos,str_arr[i],sep,height,alph);
	draw_radio_button(app_width-50,ypos,sep,30,round_type==i,header_color);
	
	if i==0
	draw_text_height_color(xx+30,ypos+65,"**will not be included in Index",header_color,25,fn_italic);
	
	draw_line_pixel(0,ypos+sep,app_width,1,c_gray,alph);
	
	if click_region_released(0,ypos,app_width,sep,true,navbar.roundtype,alph)
	return_value = i;
	}


draw_set_alpha(1);
return return_value;
}
