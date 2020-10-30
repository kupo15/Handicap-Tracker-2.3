function scr_stats_set() {


	var course_name = course_id[| course_data.name]; // course selected for stats

	var size = ds_list_size(teebox_list);
	for(var i=0;i<size;i++) // loop through tee stats
	ds_list_clear(stat_tee[i]); // clear the tee score list	

	var size = ds_list_size(master_score_list);
	for(var i=0;i<size;i++) // loop through scores
		{
		var pos = size-1-i;
		var course_pointer = master_score_list[| pos]; // get course pointer
		var course = course_pointer[| score_data.course]; // get the name
	
		// find a match is found
		if course == course_name
			{
			var _score = course_pointer[| score_data.score_]; // get the score
			var tee_color = course_pointer[| score_data.tee]; // get tee color
			var tee_ind = ds_list_find_index(teebox_list,tee_color); // get the tee index
		
			ds_list_add(stat_tee[tee_ind],real(_score)); // add the score to the list
			}
		}

	// scr_tee_filled_set();


}
