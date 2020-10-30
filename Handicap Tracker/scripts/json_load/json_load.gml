/// @param filename
function json_load(argument0) {

	var _filename = argument0;
	if file_exists(_filename)
		{
		var _wrapper = LoadJSONFromFile(_filename);
		var root_map = _wrapper[? "ROOT"];
	
		json_course_list_load(root_map);
	
		// clean up
		ds_map_destroy(_wrapper);
		show_debug_message(string(_filename)+" loaded");
		}

	


}
