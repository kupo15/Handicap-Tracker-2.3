/// @param [name]
function scr_course_add() {

	if argument_count == 0
	var name = "";
	else
	var name = argument[0];

	var course_pointer = ds_list_create_nest(master_course_list); // create course and add to master course list
 
	// add course name
	ds_list_add(course_pointer,name);

	// create tee list
	var tee_pointer_MAP = ds_map_create();
	ds_list_add(course_pointer,tee_pointer_MAP); // add tee list pointer MAP to course list
	ds_list_mark_as_map(course_pointer,1); // mark as list
	
	return tee_pointer_MAP;



}
