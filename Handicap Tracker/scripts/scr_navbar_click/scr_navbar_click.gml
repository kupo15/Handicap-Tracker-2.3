/// @param index
function scr_navbar_click(ind) {

	// switch screens
	screen_change(ind);

	switch ind
		{
		// home
		case screen.home: scr_handicap_calculate(); break;
						  
		// playing
		case screen.playing: course_id = play_course_id;
							 scr_tee_filled_set(); // set teebox fill

							 scr_handicap_calculate();
							 
							  if play_course_esc == "0"
							  play_course_esc = "";
						   
							  if play_course_teebox != noone
							  	{
							  	scr_handicap_predict(false);
							  	scr_handicap_predict(true);
							  	}
								
							  break;
				
		// stats screen
		case screen.stats: course_id = courselist_array[stat_index];
						   scr_stats_set();
						   break;							   
			
		// trends
		case screen.index: scr_trend_set(); break;
			
		// settings
		case screen.settings: break;
		}


}
