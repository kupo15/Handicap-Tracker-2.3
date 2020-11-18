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

draw_text_height(xx,yy+((debugyoff+0)*sep),"screenDarkenIndex: "+string(screenDarkenIndex),height);
draw_text_height(xx,yy+((debugyoff+1)*sep),"screenDarkenAlpha: "+string(screenDarkenAlpha),height);
draw_text_height(xx,yy+((debugyoff+2)*sep),"kvLastString:",height);
draw_text_height(xx,yy+((debugyoff+3)*sep),string(kvLastString),height);
draw_text_height(xx,yy+((debugyoff+4.5)*sep),"stringxpos: "+string(debugStringXpos),height);
draw_text_height(xx,yy+((debugyoff+5.5)*sep),"stringypos: "+string(debugStringYpos),height);
draw_text_height(xx,yy+((debugyoff+6.5)*sep),"stringHeight: "+string(debugStringHeight),height);

debugyoff = 15;
//debug_draw_click_highlight(xx,yy,debugyoff,sep,height);
//debug_draw_vk(xx,yy,debugyoff,sep,height);
debug_draw_textbox(xx,yy,debugyoff,sep,height);
//debug_draw_modes(xx,yy,debugyoff,sep,height);
//debug_draw_textbox_cursor(xx,yy,debugyoff,sep,height);	
//debug_draw_scrollbars(xx,yy,debugyoff,sep,height);	
//debug_device_info(xx,yy,debugyoff,sep,height);	
//draw_text_height(xx,yy+((debugyoff+0)*sep),"numpad_value: "+string(numpad_value),height);
//debug_draw_calendar(xx,yy,debugyoff,sep,height);
	
//draw_text_height(xx,yy+(25*sep),"search results "+string(ds_list_size(searchedList)),height);
//draw_text_height(xx,yy+((debugyoff+0)*sep),"Resolution: "+string(win_ww)+"x"+string(win_hh),height); // resolution
	
debug_draw_mouse(xx,yy,debugyoff,sep,height);

// right side
var size = ds_list_size(deleteList);
for(var i=0;i<size;i++)
draw_text_height(550,yy+(i*sep),deleteList[| i],height);
	
yy += (size+1)*sep;
draw_text_height(550,yy+(0*sep),string(ds_stack_size(prev_screen_stack))+": "+string(ds_stack_top(prev_screen_stack)),height);
	
draw_set_colour(c_black);

/*
draw_text_height(xx,yy+(10*sep),string(ds_exists(debug_id1,ds_type_list)),height);
draw_text_height(xx,yy+(11*sep),string(ds_exists(debug_id,ds_type_list)),height);

*/
}

