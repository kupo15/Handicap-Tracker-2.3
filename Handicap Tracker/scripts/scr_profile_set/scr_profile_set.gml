function scr_profile_set(ind) {
/// @param index

profile_index = ind;
META_data.profileIndex = profile_index;
	
// set
user_disp_name = PROFILE_data.dispName;	
scorelist_array = SCORE_data;
play_course_struct = ACTIVE_data;
}

function scr_profile_create(name) {
/// @param [name]	
	
if argument[0] == undefined
name = "";
	
var profileData = {
		
		dispName: name,
		index: "N/A",
		
		scorelist: array_create(0),
		activeRound: scr_score_create(""),
		}	
	
array_push(ROOT_data_struct.profiles,profileData);
}