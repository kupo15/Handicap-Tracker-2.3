/// @param parent_list
/// @param [debug_list]
function ds_list_create_nest() {

	var nest_parent = argument[0];
	var debug_list = noone;

	var list_id = ds_list_create(); // create the list
	ds_list_add(nest_parent,list_id); // add to parent list

	var last_entry = ds_list_size(nest_parent)-1;
	ds_list_mark_as_list(nest_parent,last_entry); // mark list

	if argument_count > 1
		{
		debug_list = argument[1];
		ds_list_add(debug_list,list_id);
		}

	return list_id; // return created list


}
