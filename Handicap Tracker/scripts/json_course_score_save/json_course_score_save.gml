/// @param root_map
function json_course_score_save(argument0) {

	var root_map = argument0;

	// add version number
	ds_map_add(root_map,"Version",json_version);

	// add playing course variables
	ds_map_add(root_map,"playing_course_index",play_course_index);
	ds_map_add(root_map,"playing_course_name",play_course_name);
	ds_map_add(root_map,"playing_teebox",play_course_teebox);
	ds_map_add(root_map,"playing_teebox_index",play_course_teebox_index);
	ds_map_add(root_map,"playing_yardage",play_course_yardage);
	ds_map_add(root_map,"playing_slope",play_course_slope);
	ds_map_add(root_map,"playing_rating",play_course_rating);
	ds_map_add(root_map,"playing_handicap_inc",play_course_handicap_inc);
	ds_map_add(root_map,"playing_handicap_dec",play_course_handicap_dec);

	// add course list
	ds_map_add_list(root_map,"course list",master_course_list);

	// add scores list
	ds_map_add_list(root_map,"score list",master_score_list);



}
