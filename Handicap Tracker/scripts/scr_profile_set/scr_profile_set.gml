function scr_profile_set(ind) {
	
profile_index = ind;	
	
// set
var data_struct = ROOT_data_struct.profiles[profile_index];

user_disp_name = data_struct.name;	
scorelist_array = data_struct.scorelist;
play_course_struct = data_struct.activeRound;

}