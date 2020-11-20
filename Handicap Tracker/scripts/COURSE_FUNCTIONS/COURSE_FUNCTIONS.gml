
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