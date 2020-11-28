function scr_profile_set(ind) {
/// @param index

profile_index = ind;	
	
// set
user_disp_name = PROFILE_data.dispName;	
scorelist_array = PROFILE_data.scorelist;
play_course_struct = PROFILE_data.activeRound;
}

function scr_profile_create(name) {
/// @param [name]	
	
if argument[0] == undefined
name = "";
	
var profileData = {
		
		dispName: name,
		index: "N/A",
		
		scorelist: array_create(0),
		activeRound: scr_playing_clear(),
		}	
	
array_push(ROOT_data_struct.profiles,profileData);
}