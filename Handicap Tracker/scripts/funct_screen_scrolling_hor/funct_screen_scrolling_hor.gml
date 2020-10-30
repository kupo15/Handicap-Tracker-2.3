
function funct_screen_scrolling_hor(xx,yy,ww,hh,sep,list_size,list_disp,offset_start_pointer,offset_pointer,scrollbar_index,sub) {

	if (list_size < list_disp) || (sub != submenu)
	exit;    

	// flicking speed slow down
	scrollbar_speed[scrollbar_index] -= fric*sign(scrollbar_speed[scrollbar_index]);

	if abs(scrollbar_speed[scrollbar_index]) < fric
	scrollbar_speed[scrollbar_index] = 0;
	
	// scrolling
	if click_region_pressed(xx,yy,ww,hh,false)
		{
		var offset_value = ref_get(offset_pointer); // get the value of the original offset variable
		ref_set(offset_start_pointer,offset_value); // set pointer variable of offset start
	
		scrollbar_index_scrolling = scrollbar_index;
		}
	else if mouse_check_button_released(mb_left)
		{
		debug_flick_speed = scrollbar_speed[scrollbar_index];
		scrollbar_index_scrolling = noone;
		timer[timer_index.flick] = -1;
		}

	var offset_var;

	if scrollbar_index == scrollbar_index_scrolling
	    {
		var offset_var;
	    var num = 1/sep;
	    var amt = (mouse_xdist*num);
		var flick_amt = (mouse_x-mouse_xprev);
	
		var flick_speed = abs(flick_amt)*num;
		flick_speed = clamp(flick_speed,num,flick_max);
	
	    scrollbar_speed[scrollbar_index] = flick_speed*sign(flick_amt) // set the flicking speed
	
		if mouse_x != mouse_xprev // if the mouse moved since the last step
			{
			can_flick = true;
			timer[timer_index.flick] = flick_window;
			}
	
		offset_var = ref_get(offset_start_pointer)-amt;
	    }
	else
	offset_var = ref_get(offset_pointer)-(scrollbar_speed[scrollbar_index])*can_flick;
	
	// keep the offset variable in bounds
	var offset_test = offset_var;

	/*if offset_var < 0
		{
		refresh_pos = clamp(abs(offset_var),0,refresh_dist);
		refresh_pos_end = refresh_pos;
		}*/
	
	offset_var = clamp(offset_var,0,list_size-list_disp);	

	// if hit the end
	if offset_test != offset_var
		{
		scrollbar_speed[scrollbar_index] = 0; // stop speed
		timer[timer_index.scroll_end] = 30;
		}
	
	// set the original offset vars
	ref_set(offset_pointer,offset_var);
	
	// draw scrollbar
	var offset_var = ref_get(offset_pointer); // get the value of offset pointer

	// funct_draw_scrollbar(res_bleed_xx+5,yy,list_disp,0,list_size,6,offset_var,sep,-5,c_gray,scrollbar_index);




}
