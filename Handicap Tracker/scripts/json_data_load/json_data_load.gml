function json_data_load() {
	ini_teebox();

	master_course_list = ds_list_create();
	master_score_list = ds_list_create();
	recent_scores_list = ds_list_create();
	active_scores_grid = ds_grid_create(4,20);

	// debug_reset = true;
	json_load(save_data);

	ds_list_sort_nested(master_score_list,score_data.date,false); // date sort
	rounds_played = ds_list_size(master_score_list);
	round_selection = 20;
	top_scores = 8;



}
