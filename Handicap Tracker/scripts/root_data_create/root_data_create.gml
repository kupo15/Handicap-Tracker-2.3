function root_data_create() {
	
courselist_array = array_create(0);
handicap_season_array = array_create(0);

ini_handicap_season();

ROOT_data_struct = {
	
	courselist: courselist_array,
	seasonList: handicap_season_array,
	profiles: [],
	
	meta: {
		profileIndex: 0,
		scoreSort: score_sort.currentYear,
		courseSort: course_sort.abc,
		version: json_version,
		},
	}
}