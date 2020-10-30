/// @param [name
/// @param tee
/// @param yardage
/// @param slope
/// @param rating
/// @param par]
function scr_course_add_index() {

	if argument_count == 0
		{
		var name = "";
		var tee = noone;
		var yardage = undefined;
		var slope = undefined;
		var rating = undefined;
		var par = undefined;
		}
	else
		{
		var name = argument[0];
		var tee = argument[1];
		var yardage = argument[2];
		var slope = argument[3];
		var rating = argument[4];
		var par = argument[5];
		}

	var index = find_index(name,master_course_list);

	if index != noone
		{
		var course_pointer = master_course_list[| index];
		scr_tee_update(course_pointer,tee,yardage,slope,rating,par);
		exit;
		}

	var course_pointer = ds_list_create_nest(master_course_list); // create course

	// add course data
	ds_list_add(course_pointer,name); // add course name

	var tee_pointer_MAP = ds_map_create();
	ds_list_add(course_pointer,tee_pointer_MAP); // add tee list pointer MAP to course pointer list
	ds_list_mark_as_map(course_pointer,1); // mark as map

	// add teebox pointer
	var size = ds_list_size(teebox_list); // number of teeboxes
	for(var i=0;i<size;i++)
		{
		var tee_str = teebox_list[| i]; // get the color of the tee marker
	
		var tee_data_pointer = ds_list_create(); // create the teebox data list
		ds_map_add_list(tee_pointer_MAP,string(tee_str),tee_data_pointer); // add teebox pointer to tee MAP
	
		// add data
		ds_list_add(tee_data_pointer,yardage); // yardage
		ds_list_add(tee_data_pointer,slope); // slope
		ds_list_add(tee_data_pointer,rating); // rating
		ds_list_add(tee_data_pointer,par); // par

		if tee != i // clear out the tee that isn't being set via the argument
			{
			tee_data_pointer[| 0] = ""; // yardage
			tee_data_pointer[| 1] = ""; // slope
			tee_data_pointer[| 2] = ""; // rating
			tee_data_pointer[| 3] = ""; // par
			}
		}
	
	return ds_list_size(master_course_list)-1;



}
