
function scr_course_create(name,array) {
/// @param name
/// @param [arrayId]

// create struct
course_struct = {
	
	courseName: name,
	
	subcourses: [
		{
		name: name,
		}
		]
		
	}
		
// add to master courselist
if argument[1] != undefined
array_push(array,course_struct);

return course_struct;
}

function scr_course_add_tee(struct,teeColor,yardage,slope,rating,par) {
/// @param struct
/// @param teeColor
/// @param [yardage
/// @param slope
/// @param rating
/// @param par]

if argument[2] == undefined
yardage = "";

if argument[3] == undefined
slope = "";

if argument[4] == undefined
rating = "";

if argument[5] == undefined
par = "";


// create tee struct
var tee = {
	
	courseYardage: yardage,
	courseSlope: slope,
	courseRating: rating,
	coursePar: par,
	}

// add tee color data to active course's teeMap
variable_struct_set(struct.subcourses[subcourse_index],string_lower(teeColor),tee);
}

function scr_course_tee_set(teeCol) {
	
var tee_struct = variable_struct_get(activeStruct.subcourses[subcourse_index],string_lower(teeCol));

// create new tee
if tee_struct == undefined
scr_course_add_tee(activeStruct,teeCol);
}
	
