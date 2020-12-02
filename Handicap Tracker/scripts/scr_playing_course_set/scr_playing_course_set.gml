function scr_playing_course_set() {

scr_handicap_calculate();
scr_tee_filled_set(); // mark tees with data					

course_struct = course_find_array(active_course_struct.courseName,COURSE_database);					 	 

if active_course_struct.teeData.teeColor != ""
	{
	scr_handicap_predict(90,false); // determine lower handicap
	scr_handicap_predict(active_course_struct.handicapData.handicap_dec,true); // determine upper handicap
	}
		
exit
active_course_struct.handicapData.esr = pick(active_course_struct.handicapData.esr,"",active_course_struct.handicapData.esr == "0");						    				
}