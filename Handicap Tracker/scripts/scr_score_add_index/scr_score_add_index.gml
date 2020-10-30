/// @param course_name
/// @param tee_color
/// @param score
/// @param date
/// @param [strokes]
function scr_score_add_index() {

	var c_name = argument[0];
	var tee_color = argument[1];
	var _score = argument[2];
	var date = argument[3];
	var strokes = "0";

	if argument_count > 4
	var strokes = argument[4];

	var index = find_index(c_name,master_course_list);

	if index == noone
		{
		show_message(string(c_name)+" not found");
		exit;
		}

	var course_pointer = master_course_list[| index]; // course pointer
	var course_name = course_pointer[| 0];

	var ind = ds_list_size(master_score_list);
	var list = ds_list_create(); // create a score list
	ds_list_add(master_score_list,list); // add score to master score list
	ds_list_mark_as_list(master_score_list,ind); // mark master score list entry as list

	var tee_pointer_MAP = course_pointer[| 1];
	// var tee_color = teebox_list[| tee];
	var tee_data_pointer = tee_pointer_MAP[? tee_color];
	var course_yardage = tee_data_pointer[| 0];
	var course_slope = tee_data_pointer[| 1];
	var course_rating = tee_data_pointer[| 2];
	var course_par = tee_data_pointer[| 3];

	// add score data
	ds_list_add(list,course_name);
	ds_list_add(list,tee_color);
	ds_list_add(list,course_yardage);
	ds_list_add(list,course_slope);
	ds_list_add(list,course_rating);
	ds_list_add(list,course_par);
	ds_list_add(list,_score);
	ds_list_add(list,date);
	ds_list_add(list,strokes);
	ds_list_add(list,"-4"); // course handicap
	ds_list_add(list,"-4"); // index history
	ds_list_add(list,0); // esr

	rounds_played ++;

	return ind;


}
