function draw_debug() {
	if os_type == os_android
	exit;

	var xx = -260;
	var yy = 10;
	var sep = 30;
	var height = 30;

	var win_ww = window_get_width();
	var win_hh = window_get_height();

	draw_set_colour(c_white);
	draw_set_halign(fa_left);

	var yoff = 0;
	draw_text_height(xx,yy+((yoff+0)*sep),"submenu prev: "+string(submenu_previous),height);
	draw_text_height(xx,yy+((yoff+1)*sep),"submenu: "+string(submenu),height);
	draw_text_height(xx,yy+((yoff+2)*sep),"course_id: "+string(course_id),height);
	draw_text_height(xx,yy+((yoff+3)*sep),"teebox_index: "+string(teebox_index),height);
	draw_text_height(xx,yy+((yoff+4)*sep),"score_off_st: "+string(score_list_offset_start),height);
	draw_text_height(xx,yy+((yoff+5)*sep),"score_off: "+string(score_list_offset),height);
	draw_text_height(xx,yy+((yoff+6)*sep),"click_ypos: "+string(click_highlight_ypos),height);
	draw_text_height(xx,yy+((yoff+7)*sep),"click_index: "+string(click_highlight_index),height);
	draw_text_height(xx,yy+((yoff+8)*sep),"course_edit_name:",height);
	draw_text_height(xx,yy+((yoff+9)*sep),"'"+string(course_edit_name)+"'",height,fn_italic);

	var yoff = 11;
	// draw_text_height(xx,yy+(11*sep),"vk_active: "+string(kv_active),height);
	draw_text_height(xx,yy+((yoff+0)*sep),"vk_status: "+string(kv_status),height);
	draw_text_height(xx,yy+((yoff+1)*sep),"keyboard_string:",height);
	draw_text_height(xx,yy+((yoff+2)*sep),"'"+keyboard_string+"'",height,fn_italic);
	
	var yoff = 15;
	draw_text_height(xx,yy+((yoff+0)*sep),"textbox_index: "+string(textbox_index),height);
	draw_text_height(xx,yy+((yoff+1)*sep),"texStringLength: "+string(textboxStringLength),height);
	draw_text_height(xx,yy+((yoff+2)*sep),"texStringWidth: "+string(textboxStringWidth),height);
	draw_text_height(xx,yy+((yoff+3)*sep),"texStringScale: "+string(textboxStringScale),height);

	var yoff = 20;
	draw_text_height(xx,yy+((yoff+0)*sep),"cursPosStart "+string(cursorPosStart),height);
	draw_text_height(xx,yy+((yoff+1)*sep),"cursorPos "+string(cursorPos),height);
	draw_text_height(xx,yy+((yoff+2)*sep),"cursorHoverPos "+string(cursorHoverPos),height);
	draw_text_height(xx,yy+((yoff+3)*sep),"cursorXposOff "+string(cursorXposOff),height);
	
	var yoff = 25;
	draw_text_height(xx,yy+((yoff+0)*sep),"temp_score "+string(temp_score),height);
	draw_text_height(xx,yy+((yoff+1)*sep),"temp_strokes "+string(temp_strokes),height);
	
	/*draw_text_height(xx,yy+(18*sep),"course_off_start "+string(course_list_offset_start),height);
	draw_text_height(xx,yy+(19*sep),"course_offset "+string(course_list_offset),height);*/
	
	var yoff = 27;
	draw_text_height(xx,yy+((yoff+0)*sep),"scrollbar_spd "+string(scrollbar_speed[0]),height);
	draw_text_height(xx,yy+((yoff+1)*sep),"scrollbar_ind_scro "+string(scrollbar_index_scrolling),height);

	/*draw_text_height(xx,yy+(15*sep),"month start "+string(month_offset_start),height);
	draw_text_height(xx,yy+(16*sep),"month "+string(month_offset),height);
	draw_text_height(xx,yy+(17*sep),"month end "+string(month_offset_end),height);
	draw_text_height(xx,yy+(18*sep),"month parse "+string(month_parse),height);

	draw_text_height(xx,yy+(20*sep),"day end "+string(day_offset_end),height);
	draw_text_height(xx,yy+(21*sep),"day span "+string(day_span_select),height);

	draw_text_height(xx,yy+(24*sep),"year parse "+string(year_parse),height);*/

	// draw_text_height(xx,yy+(25*sep),"search results "+string(ds_grid_height(search_grid)),height);

	var yoff = 29;
	draw_text_height(xx,yy+((yoff+0)*sep),string(win_ww)+"x"+string(win_hh),height); // resolution
	draw_text_height(xx,yy+((yoff+1)*sep),string(mouse_x)+","+string(mouse_y),height); // mouse coor

	// right side
	var size = ds_list_size(delete_list);
	for(var i=0;i<4;i++)
	draw_text_height(550,yy+(i*sep),temp_tee_data[0][|i],height);

	draw_set_colour(c_black);

	/*


	draw_text_height(xx,yy+(10*sep),string(ds_exists(debug_id1,ds_type_list)),height);
	draw_text_height(xx,yy+(11*sep),string(ds_exists(debug_id,ds_type_list)),height);

	if keyboard_check_pressed(vk_space)
		{
		debug_id1 = master_course_list[| 5];
		debug_id = master_score_list[| 5];
		}

	if keyboard_check_pressed(vk_backspace)
		{
		ds_list_destroy(master_score_list);
		ds_list_destroy(master_course_list);
		}



/* end draw_debug */
}
