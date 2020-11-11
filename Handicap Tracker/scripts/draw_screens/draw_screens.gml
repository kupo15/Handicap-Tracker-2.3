function draw_screens() {
	
// android back
if androidBack
	{
	if mode_delete
		{
		mode_delete = false;
		androidBack = false;
		}
	else if submenu == navbar.main
		{
		if (screenIndex == screen.home) && (os_type == os_android)
		game_end();

		scr_handicap_calculate();
		screenIndex = screen.home;
		}
	}
	
draw_set_halign(fa_left);
switch screenIndex
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

//draw_darken_screen();
draw_sidebar_main_menu();
draw_nav_bar();

draw_courselist_list();
draw_teebox_list();
draw_popup_par();
draw_playing_score_enter();
	
draw_highlight_click_static(submenu != navbar.sidebar);


// update the virtual keyboard
if kvActive // || timer[timerIndex.vk_switch] > -1
	{
	kvLastString = keyboard_string;
	kvInputString = keyboard_string; // get string input
	}

if androidBack
vk_hide();

}
