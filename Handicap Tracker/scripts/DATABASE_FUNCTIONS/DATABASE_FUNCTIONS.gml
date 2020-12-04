function database_course_get_pointer(courseId,key,source) {
/// @param courseId
/// @param [key
/// @param source]	
	
if argument[2] == undefined
source = COURSE_database;

var size = array_length(source);
for(var i=0;i<size;i++)
	{
	var pointer = source[i];
	var test_courseId = pointer.courseID;
	
	if courseId == test_courseId
		{
		if key == undefined // return the whole struct
		return pointer;
		else
		return variable_struct_get(pointer,key); // return the key
		}
	}

return undefined;
}

function database_course_get_index(courseId,source) {
/// @param courseId
/// @param [source]	

if argument[1] == undefined
source = COURSE_database;

var size = array_length(source);
for(var i=0;i<size;i++)
	{
	var pointer = source[i];
	var test_courseId = pointer.courseID;
	
	if courseId == test_courseId
	return i;
	}

return undefined;
}	