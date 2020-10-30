function scr_handicap_calculate_old() {
	/*
	var diff_arr = ds_list_create();
	var pos_start = 0; // max(0,rounds_played-round_selection);
	var pos_end = min(rounds_played,round_selection);
	for(var i=pos_start;i<pos_end;i++) // loop through last x score list
		{
		var score_pointer = master_score_list[| i];
		var score_test = score_pointer[| score_data.score_];
		if score_test == "" // if blank
			{
			ds_list_delete(master_score_list,i);
			i --;
			pos_end --;
			continue;
			}
	
		var _strokes = score_pointer[| score_data.strokes];
		if _strokes == ""
		_strokes = 0;
	
		var score_ = real(score_pointer[| score_data.score_])-real(_strokes);
		var course_rating = real(score_pointer[| score_data.rating]);
		var course_slope = real(score_pointer[| score_data.slope]);
	
		var diff = score_-course_rating;
		var adj_diff = diff*113/course_slope;

		ds_list_add(diff_arr,adj_diff); // add last 20 diff to list
		}
	
	ds_list_sort(diff_arr,true);

	var list_size = ds_list_size(diff_arr); // up to 20 scores
	var top_limit = min(list_size,top_scores); // up to top 8 scores
	var ave = 0;

	for(var i=0;i<top_limit;i++)
		{
		show_debug_message(diff_arr[| i]);
		ave += diff_arr[| i];
		}

	ds_list_destroy(diff_arr);

	ghin_index = ave/top_limit;

	show_debug_message("handicap_calculated");
	show_debug_message(round_tenth(ghin_index));


/* end scr_handicap_calculate_old */
}
