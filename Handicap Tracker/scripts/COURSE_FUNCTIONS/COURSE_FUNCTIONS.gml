
function scr_course_create(name,array) {
/// @param name
/// @param [arrayId]

// create struct
active_course = {
	
	courseName: name,
	
	subcourses: [
		{
		name: name,
		}
		]
		
	}
		
// add to master courselist
if argument[1] != undefined
scr_course_add_array(array,active_course);

return active_course;
}

function scr_course_add_array(array,courseStruct) {
	
array_push(array,courseStruct);	
}

function scr_course_add_tee(courseName,teeColor,yardage,slope,rating,par) {
/// @param courseName
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
active_tee = {
	
	courseYardage: yardage,
	courseSlope: slope,
	courseRating: rating,
	coursePar: par,
	}

// add tee color data to active course's teeMap
variable_struct_set(active_course.subcourses[0],string_lower(teeColor),active_tee);
}

function scr_course_details_update() {
		
// overwrite struct
courselist_array[@ course_index] = active_course;

// reset variables
course_index = undefined;
active_course = undefined;
}

function scr_course_details_tee_update() {

// set variables	
active_tee.courseYardage = course_edit_yardage;
active_tee.courseSlope = course_edit_slope;
active_tee.courseRating = course_edit_rating;
active_tee.coursePar = course_edit_par;

// reset variables
course_edit_yardage = "";
course_edit_slope = "";
course_edit_rating = "";
course_edit_par = "";

active_tee = undefined;

scr_tee_filled_set(active_course); // mark tees with data
}
	
function scr_course_tee_set(teeCol) {

// create new tee
if active_tee == undefined
	{
	scr_course_add_tee(undefined,teeCol);
	exit;
	}
	
// set existing tee variables
course_edit_yardage = active_tee.courseYardage;
course_edit_slope = active_tee.courseSlope;
course_edit_rating = active_tee.courseRating;
course_edit_par = active_tee.coursePar;	
}