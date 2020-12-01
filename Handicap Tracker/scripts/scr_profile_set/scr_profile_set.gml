
function scr_profile_create(name) {
/// @param [name]	
	
if argument[0] == undefined
name = "";

var profileData = {
		
		dispName: name,
		index: "N/A",
		
		scorelist: array_create(0),
		activeRound: create_score,
		}	
	
array_push(ROOT_data_struct.profiles,profileData);
}

function scr_profile_set(ind) {
/// @param index

profile_index = ind;
META_data.profileIndex = profile_index;
	
// set
user_disp_name = PROFILE_data.dispName;	
scorelist_array = SCORE_data;
active_course_struct = ACTIVE_data;
}
