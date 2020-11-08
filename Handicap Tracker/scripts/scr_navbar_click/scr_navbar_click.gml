/// @param index
function scr_navbar_click(argument0) {

	var ind = argument0;

	switch ind
		{
		// home
		case screen.home: screenIndex = screen.home; 
						  scr_handicap_calculate();
						  break;
						  
		// playing
		case screen.playing: screenIndex = screen.playing;
							 course_id = play_course_id;
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
		case screen.stats: screenIndex = screen.stats; 
						   course_id = master_course_list[| stat_index];
						   scr_stats_set();
						   break;
		
		// score list
		case screen.score_list: screenIndex = screen.score_list; break;
		
		// course list
		case screen.course_list: screenIndex = screen.course_list; break;
		}


}
