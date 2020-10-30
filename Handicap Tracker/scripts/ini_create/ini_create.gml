function ini_create() {
	json_data_load();
	ini_timers();
	ini_highlight_vars();
	ini_cursor_vars();
	
	scrollbar_index = noone;

	searching = false;
	searched = false;
	searched_name = "";
	search_grid = ds_grid_create(2,0);
		
	can_delete = false;
	mode_delete = false;
	mode_delete_list_id = noone;
	delete_list = ds_list_create();

	old_course_name = "";

	android_back = false;

	submenu = navbar.main;
	submenu_previous = submenu;

	screen_index = 0;
	screen_index_previous = screen_index;

	handicap_trend_type = 0;

	stat_tee_index = noone;
	stat_index = 0;
	prev_screen = noone;
	course_edit_name = undefined;
	course_id = noone;
	teebox_index = 00;
	index = 0;
	textbox_index = noone;
	date_pointer = noone;

	temp_course_tee = "";
	temp_course_yardage = "";
	temp_course_slope = "";
	temp_course_rating = "";
	temp_course_par = "";

	temp_score_tee = "";
	temp_score_yardage = "";
	temp_score_slope = "";
	temp_score_rating = "";
	temp_score_par = "";

	temp_score = undefined;
	temp_strokes = undefined;

	can_click = true;

	kv_status = false;
	kv_active = false;
	kv_last_string = "";
	kv_input_string = "";

	mouse_xstart = 0;
	mouse_ystart = 0;

	mouse_xdist = 0;
	mouse_ydist = 0;

	mouse_xprev = 0;
	mouse_yprev = 0;

	day_span_select = 0;
	month_parse = 0;
	year_parse = 0;

	alpha_lerp = 0;
	alpha_lerp_end = 0;

	debug_reset = false;

	// submenus
	submenu_menu_xpos = -side_menu_width-30;
	submenu_menu_xpos_disp = submenu_menu_xpos;
	
	darken_screen = false;
	screen_darken_alpha = 0;
	screen_darken_value = 0;

#region offsets
	navbar_yoff = 0;
	navbar_yoff_start = 0;

	teebar_yoff = 0;
	teebar_yoff_start = 0;
	
	scorebar_yoff = 0;
	scorebar_yoff_start = 0;
	
	parbar_yoff = 0;
	parbar_yoff_start = 0;

	coursebar_yoff = 0;
	coursebar_yoff_start = 0;

	month_offset = 0;
	month_offset_start = 0;
	month_offset_end = 0;

	year_select_offset = 0;

	day_offset = 0;
	day_offset_start = 0;
	day_offset_end = 0;

	year_offset = 0;
	year_offset_start = 0;
	year_offset_end = 0;
	
	header_delete_offset_disp = 0;
	header_delete_offset = 0;
#endregion

#region scrollbar
	// variables
	scrollbar_num = 3;
	scrollbar_disp = array_create(scrollbar_num,0);
	scrollbar_disp_end = array_create(scrollbar_num,0);
	scrollbar_speed = array_create(scrollbar_num,0);
	scrollbar_index_scrolling = noone;

	can_flick = false;

	score_list_offset = 0;
	score_list_offset_start = score_list_offset;

	course_list_offset = 0;
	course_list_offset_start = 0;

	stat_offset = 0;
	stat_offset_start = 0;

	index_trend_offset = 0;
	index_trend_offset_start = 0;
#endregion


	debug_flick_speed = 0;

	debug_data_reset();
	scr_handicap_calculate();
}
