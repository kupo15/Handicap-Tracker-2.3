/// @param index
function scr_navbar_click(ind) {

// switch screens
screen_change(ind,undefined,true);

switch ind
	{
	// home
	case screen.home: submenu = navbar.main;
					  scr_handicap_calculate();
					  break;
						  
	// playing
	case screen.playing: course_struct = course_find_array(active_course_struct.courseName,courselist_array);

						 scr_handicap_calculate();
						 	 
						 active_course_struct.handicapData.esr = pick(active_course_struct.handicapData.esr,"",active_course_struct.handicapData.esr == "0");
						    
						 if active_course_struct.teeData.teeColor != ""
							 {
							 scr_handicap_predict(90,false); // determine lower handicap
							 scr_handicap_predict(active_course_struct.handicapData.handicap_dec,true); // determine upper handicap
							 }
							
						 scr_tee_filled_set(); // mark tees with data
						 break;
				
	// stats screen
	case screen.stats: scr_stats_set(); break;							   
			
	// trends
	case screen.indexTrend: scr_trend_set(); break;
	
	// card
	case screen.score_card: submenu = navbar.hidden; break;
						 
	// settings
	//case screen.settings: break;
	}


}
