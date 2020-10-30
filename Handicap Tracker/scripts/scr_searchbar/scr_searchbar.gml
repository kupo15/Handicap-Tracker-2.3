function scr_searchbar() {
	if searched_name == kv_last_string
	exit;

	searched = true;

	ds_grid_resize(search_grid,3,0); // clear search results

	var size = ds_list_size(master_course_list);
	for(var i=0;i<size;i++)
		{
		var pointer = master_course_list[| i];
		var name = pointer[| course_data.name];
		var add_mem = true;
		var found = string_count(string_lower(searched_name),string_lower(name)) != 0

		if found && searched_name != "" && searched_name != " "
		if add_mem
			{
			var row = grid_row_add(search_grid);
			search_grid[# 1,row] = pointer;
			search_grid[# 2,row] = i; // index
			}
		}


}
