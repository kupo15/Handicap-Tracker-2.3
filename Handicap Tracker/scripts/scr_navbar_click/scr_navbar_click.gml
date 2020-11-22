/// @param index
function scr_navbar_click(ind) {

	// switch screens
	screen_change(ind);

	switch ind
		{
		// home
		case screen.home: scr_handicap_calculate(); break;
						  
		// playing
		case screen.playing: activeStruct = play_course_struct;
							 //scr_tee_filled_set(); // set teebox fill

							 scr_handicap_calculate();
							 
							 if activeStruct.esc == "0"
							 activeStruct.esc = "";
						   
							 if activeStruct.teeColor != ""
							 	{
							 	scr_handicap_predict(90,false); // determine lower handicap
							 	scr_handicap_predict(play_course_struct.handicap_dec,true); // determine upper handicap
							 	}
							
							 break;
				
		// stats screen
		case screen.stats: course_struct = courselist_array[stat_index];
						   scr_stats_set();
						   break;							   
			
		// trends
		case screen.index: scr_trend_set(); break;
			
		// settings
		//case screen.settings: break;
		}


}
