/// @param teebox_pointer
/// @param tee
/// @param yardage
/// @param slope
/// @param rating
function scr_course_teebox_add(argument0, argument1, argument2, argument3, argument4, argument5) {

	var teebox_pointer = argument0;
	var tee_color = argument1;
	var yardage = argument2;
	var slope = argument3;
	var rating = argument4;
	var par = argument5;

	var tee_data_list = ds_list_create(); // create the teebox data
	ds_map_add_list(teebox_pointer,tee_color,tee_data_list); // add teebox pointer to teebox map

	// add tee data
	ds_list_add(tee_data_list,yardage); 
	ds_list_add(tee_data_list,slope); 
	ds_list_add(tee_data_list,rating); 
	ds_list_add(tee_data_list,par); 


}
