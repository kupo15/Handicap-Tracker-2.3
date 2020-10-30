function draw_screens() {
	
	// android back
	if android_back
		{
		if mode_delete
			{
			mode_delete = false;
			android_back = false;
			}
		else if submenu == navbar.main
			{
			if screen_index == screen.home && os_type == os_android
			game_end();

			scr_handicap_calculate();
			screen_index = screen.home;
			}
		}
	

	draw_darken_screen();

	draw_set_halign(fa_left);
	switch screen_index
	    {
	    case screen.home: draw_home(); break;
	    case screen.playing: draw_playing(); break;
	    case screen.score_list: draw_score_list(); break;
	    case screen.course_list: draw_course_list(); break;
	
	    case screen.add_score:
	    case screen.edit_score: draw_score_add(); break;
	
		case screen.add_course:
	    case screen.edit_course: draw_course_add(); break;
	
	    case screen.edit_date: draw_date_edit_calendar(); break;
	
	    case screen.stats: draw_stats(); break;
	
		case screen.index: draw_index_info(); break;
	
		case screen.score_card: draw_score_card(); break;
	
		case screen.help_info: draw_help_info(); break;
	    }
   
	// draw_footer_button();
	draw_nav_bar();
	draw_sidebar_main_menu();
	
	draw_courselist_list();
	draw_teebox_list();
	draw_popup_par();
	draw_playing_score_enter();
	
	draw_highlight_click();


	// update the virtual keyboard
	if kv_active // || timer[timer_index.vk_switch] > -1
		{
		kv_last_string = keyboard_string;
		kv_input_string = keyboard_string; // get string input
		}

	if android_back
	vk_hide();

}
