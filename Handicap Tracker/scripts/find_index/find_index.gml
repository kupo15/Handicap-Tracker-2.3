
function find_index(name,list) {
/// @param name
/// @param list_id

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

function course_find_struct(courseName,struct) {
/// @param courseName		
/// @param [sourceStruct]
		
if argument[1] == undefined
struct = courselist_struct
		
return variable_struct_get(struct,courseName);	
}