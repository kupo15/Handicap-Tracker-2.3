/*
function funct_dialogue_scrolling(xx,yy,ww,hh,sep,list_size,list_disp,offset_pointer_start,offset_pointer,scrollbar_index,sub){

	// no need to scroll if rows is less than display
	if list_size < list_disp
	exit;
	
	// flicking speed slow down
	scrollbar_speed[scrollbar_index] -= fric*sign(scrollbar_speed[scrollbar_index]);
	
	// if below fric speed stop scrollbar
	if abs(scrollbar_speed[scrollbar_index]) < fric
	scrollbar_speed[scrollbar_index] = 0;
	
	// manual scrolling
	if click_region_pressed(xx,yy,ww,hh,false) // if clicked within dialogue box
		{
		var offset_value = ref_get(offset_pointer); // get the value of the original offset variable
		ref_set(offset_pointer_start,offset_value); // set offset start pointer variable
		
		scrollbar_index_scrolling = scrollbar_index; // set the scrollbar to be using
		}
	else if mouse_check_button_released(mb_left) // released manual scrolling
		{
		show_debug_message("flick speed "+string(scrollbar_speed)); // show flick speed
		scrollbar_index_scrolling = noone; // no more manual scrolling
		timer[timer_index.flick] = -1;
		}
}