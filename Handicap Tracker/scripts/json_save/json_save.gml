/// @param filename
function json_save(argument0) {

	if screen_index == screen.add_course
	|| screen_index == screen.add_score
	exit;

	var _filename = argument0;
	var _wrapper = ds_map_create();

	var root_map = ds_map_create();
	ds_map_add_map(_wrapper,"ROOT",root_map); // add root map to wrapper

	json_course_score_save(root_map); // add data

	// save all
	var _string = json_encode(_wrapper);
	SaveStringToFile(_filename,_string);

	// destroy map
	root_map[? "course list"] = undefined;
	root_map[? "score list"] = undefined;
	ds_map_destroy(_wrapper);

	show_debug_message(string(_filename)+" saved");


}
