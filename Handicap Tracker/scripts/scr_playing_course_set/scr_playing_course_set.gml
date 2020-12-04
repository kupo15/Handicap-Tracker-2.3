function scr_playing_course_set() {

workingStruct = struct_copy(active_course_struct);
activeStruct = workingStruct;

course_struct = database_course_get_pointer(activeStruct.courseID);					 	 

if course_struct != undefined
	{
	scr_handicap_calculate();
	scr_handicap_predict(90,false); // determine lower handicap
	scr_handicap_predict(activeStruct.handicapData.handicap_dec,true); // determine upper handicap
	}
		
exit
activeStruct.handicapData.esr = pick(activeStruct.handicapData.esr,"",activeStruct.handicapData.esr == "0");						    				
}