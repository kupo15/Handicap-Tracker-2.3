function goto_draw_debug() {};

function draw_debug() {
	
if os_type == os_android
exit;

var win_ww = window_get_width();
var win_hh = window_get_height();
	
var xx = -375;
var yy = 10;
var sep = 30;
var height = 30;

debugyoff = 0;

draw_set_colour(c_white);
draw_set_halign(fa_left);

debug_draw_screens(xx,yy,debugyoff,sep,height);
//debug_draw_screen_darken(xx,yy,debugyoff,sep,height);

draw_text_height(xx,yy+((debugyoff+0)*sep),"courseStruct: "+string(course_struct != undefined),height);
draw_text_height(xx,yy+((debugyoff+1)*sep),"scoreStruct: "+string(score_struct != undefined),height);
draw_text_height(xx,yy+((debugyoff+2)*sep),"activeScore: "+string(active_score != undefined),height);
draw_text_height(xx,yy+((debugyoff+3)*sep),"activeCourse: "+string(active_course != undefined),height);
draw_text_height(xx,yy+((debugyoff+4)*sep),"activeTee: "+string(active_tee != undefined),height);

debugyoff = 11;
//debug_draw_click_highlight(xx,yy,debugyoff,sep,height);
//debug_draw_vk(xx,yy,debugyoff,sep,height);
debug_draw_strings(xx,yy,debugyoff,sep,height);
debug_draw_textbox(xx,yy,debugyoff,sep,height);
//debug_draw_modes(xx,yy,debugyoff,sep,height);
//debug_draw_textbox_cursor(xx,yy,debugyoff,sep,height);	
debug_draw_scrollbars(xx,yy,debugyoff,sep,height);	
//debug_device_info(xx,yy,debugyoff,sep,height);	
//draw_text_height(xx,yy+((debugyoff+0)*sep),"numpad_value: "+string(numpad_value),height);
//debug_draw_calendar(xx,yy,debugyoff,sep,height);
	
//draw_text_height(xx,yy+(25*sep),"search results "+string(ds_list_size(searchedList)),height);
//draw_text_height(xx,yy+((debugyoff+0)*sep),"Resolution: "+string(win_ww)+"x"+string(win_hh),height); // resolution
	
debug_draw_mouse(xx,yy,debugyoff,sep,height);

// right side
var xx = 550;

// draw elements
var size = ds_list_size(deleteList);
for(var i=0;i<size;i++)
draw_text_height(xx,yy+(i*sep),deleteList[| i],height);
	
yy += (size+1)*sep;

// draw prev screen stack
var size = ds_list_size(prev_screen_stack);

// draw current screen
var str = script_get_name(drawScreen[screenIndex]);
str = string_replace(str,"draw_","");
draw_text_height(xx,yy+(0*sep),"CurrentScreen: "+string(str),height);

// draw dividing line
draw_line(xx,yy+sep,xx+300,yy+sep);

// draw prev screens
for(var i=0;i<size;i++)
	{
	var val = prev_screen_stack[| size-i-1];
	var str = script_get_name(drawScreen[val]);

	draw_text_height(xx,yy+((i+1)*sep),str,height);
	}
		
draw_set_colour(c_black);
}

