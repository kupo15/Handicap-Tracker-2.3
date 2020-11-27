function root_data_create() {
	
courselist_array = array_create(0);
scorelist_array = array_create(0);
handicap_season_array = array_create(0);

ini_handicap_season();
scr_playing_clear();

ROOT_data_struct = {
	
	version: json_version,
	courselist: courselist_array,
	seasonList: handicap_season_array,
	
	profiles: [	
		{
		
		name: "",
		
		scorelist: scorelist_array,
		activeRound: play_course_struct,
		}
	],
	
	meta: {
		profileIndex: 0,
		courseSort: course_sort.abc,
		},
	}

}