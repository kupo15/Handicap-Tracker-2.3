/// @param handicap_index
/// @param course_slope
/// @param course_rating
/// @param course_par
function scr_course_handicap(argument0, argument1, argument2, argument3) {

	var current_index = argument0;
	var course_slope = argument1;
	var course_rating = argument2;
	var course_par = argument3;

	var course_hand = (real(current_index)*real(course_slope)/113)+real(course_rating)-real(course_par);

	return round(course_hand);
}
