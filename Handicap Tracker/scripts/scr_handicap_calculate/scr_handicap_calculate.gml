function scr_handicap_calculate() {
	
	ds_list_sort_nested(master_score_list,score_data.date,true); // date sort

	// clear ESR
	var size = ds_list_size(master_score_list);
	for(var i=0;i<size;i++)
		{
		var pointer = master_score_list[| i];
		pointer[| score_data.esr] = 0;
		}

	// calculate handicaps
	var diff_arr = ds_list_create();
	var index_prev = noone;
	var num = clamp(rounds_played-round_selection+1,1,rounds_played); // number of rounds to calculate
	for(var n=0;n<num;n++)
		{
		var pos_start = n;
		var pos_end = min(n+round_selection,rounds_played);
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
			var course_par = real(score_pointer[| score_data.par]);
	
			var diff = score_-course_rating;
			var adj_diff = diff*113/course_slope;

			ds_list_add(diff_arr,adj_diff); // add 20 diff to list
		//	show_debug_message(score_pointer[| score_data.course]+": "+string(round_tenth(adj_diff)));
			}
			
		ds_list_sort(diff_arr,true);


		var list_size = ds_list_size(diff_arr); // up to 20 scores
		var top_limit = min(list_size,top_scores); // up to top 8 scores
		var ave = 0;
	
		for(var i=0;i<top_limit;i++)
			{
			show_debug_message(round_tenth(diff_arr[| i]));
			ave += diff_arr[| i];
			}

		var index_history = clamp(round_tenth(ave/top_limit),-20,54);
		score_pointer[| score_data.index] = index_history; // set the index up to this point
	
		// set course handicap at this point
		if index_prev != noone
			{
			var course_handicap = scr_course_handicap(index_prev,course_slope,course_rating,course_par);
			score_pointer[| score_data.course_handicap] = course_handicap;
			}
	
		var index_prev = index_history;
		ds_list_clear(diff_arr);
		show_debug_message("********************");
		}
	
	ghin_index = index_history; // set current index

			// set ESR
		/*	var esr_test = 0;
		
			if score_ <= course_par+course_handi-10 // if shot 10 or better strokes than expected
			esr_test = 2;
			else if score_ <= course_par+course_handi-7 // if shot 7 or better strokes than expected
			esr_test = 1;

			if esr_test != 0 // an esr reduction is in effect
				{
				var esr_start = n+1;
				var esr_end = min(n+round_selection,rounds_played);

				for(var a=esr_start;a<esr_end;a++)
				score_pointer[| score_data.esr] += esr_test;
				}*/

	ds_list_sort_nested(master_score_list,score_data.date,false); // date sort
	ds_list_destroy(diff_arr);

	// set recent scores
	ds_list_clear(recent_scores_list);
	ds_grid_clear(active_scores_grid,"");

	var size = min(rounds_played,round_selection);
	for(var i=0;i<size;i++)
		{
		var score_pointer = master_score_list[| i];
		var _score = score_pointer[| score_data.score_];

		ds_list_add(recent_scores_list,score_pointer); // add recent 20 score pointers
	
		// set active scores
		active_scores_grid[# 0,i] = i; // index
		active_scores_grid[# 1,i] = score_pointer; // pointer
		active_scores_grid[# 2,i] = _score; // score
		active_scores_grid[# 3,i] = false; // active
		}
	
	ds_grid_sort(active_scores_grid,2,true); // sort by scores

	// set the first 8 scores to active
	for(var i=0;i<8;i++)
	active_scores_grid[# 3,i] = true;

	ds_grid_sort(active_scores_grid,0,true); // sort by index

	// debug
	show_debug_message("handicap index calculated");
	show_debug_message(ghin_index);



}
