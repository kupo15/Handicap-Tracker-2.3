/// @param index
function scr_navbar_click(ind) {

// switch screens
screen_change(ind,undefined,true);

switch ind
	{
	// home
	case screen.home: scr_handicap_calculate(); break;
						  
	// playing
	case screen.playing: activeStruct = play_course_struct;

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
	case screen.stats: if array_length(courselist_array) > 0
						   {
						   course_struct = courselist_array[stat_index];					 
						   scr_stats_set();
						   }
						   
					   break;							   
			
	// trends
	case screen.indexTrend: scr_trend_set(); break;
			
	// settings
	//case screen.settings: break;
	}


}
