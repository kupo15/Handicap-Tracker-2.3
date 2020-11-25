function root_data_create() {
	
courselist_array = array_create(0);
scorelist_array = array_create(0);
scr_playing_clear();

ROOT_data_struct = {
	
	version: json_version,
	courselist: courselist_array,
	
	profiles: [	
		{
		
		name: "",
		
		scorelist: scorelist_array,
		activeRound: play_course_struct,
		}
	],
	
	meta: {
		profileIndex: 0,
		},
	}

}