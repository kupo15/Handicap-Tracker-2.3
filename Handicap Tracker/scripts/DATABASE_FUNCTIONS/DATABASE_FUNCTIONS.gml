function database_course_get_pointer(courseId,key,source) {
/// @param courseId
/// @param [key
/// @param source]	
	
if argument[2] == undefined
source = COURSE_database;

var size = array_length(COURSE_database);
for(var i=0;i<size;i++)
	{
	var pointer = COURSE_database[i];
	var test_courseId = pointer.courseID;
	
	if courseId == test_courseId
		{
		if key == undefined // return the whole struct
		return pointer;
		else
		return variable_struct_get(pointer,key);
		}
	}

return undefined;
}