/// @param name
/// @param list_id
function find_index(argument0, argument1) {

	var name = argument0;
	var list = argument1;
	var index = noone;

	// search the list for the name
	var size = ds_list_size(list);
	for(var i=0;i<size;i++)
		{
		var course_pointer = list[| i];
	    var course_name = course_pointer[| 0]; // course name
	
		if name == course_name
			{
			var index = i;
			break;
			}
		}
	
	return index; // returns the index of a course in the list




}
