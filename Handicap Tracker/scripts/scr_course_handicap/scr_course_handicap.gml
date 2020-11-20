
function scr_course_handicap(current_index,course_slope,course_rating,course_par) {

var course_hand = (real(current_index)*real(course_slope)/113)+real(course_rating)-real(course_par);

return round(course_hand);
}
