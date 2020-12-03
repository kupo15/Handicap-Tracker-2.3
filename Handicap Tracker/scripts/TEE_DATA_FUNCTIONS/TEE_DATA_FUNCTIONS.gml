
function scr_score_tee_update(score_struct_pointer,course_struct_pointer,teeColor,yardage,slope,rating,par) {
/// @param score_struct_pointer
/// @param course_struct_pointer
/// @param tee_color
/// @param [yardage
/// @param slope
/// @param rating
/// @param par]

var teePointer = variable_struct_get(course_struct_pointer.subcourses[subcourse_index].teeData,string_lower(teeColor));

if teePointer == undefined
	{
	sm("tee not found >> not setting tee update");
	exit;
	}

// default
if argument[2] == undefined
yardage = "";
else
yardage = teePointer.teeYardage;

if argument[3] == undefined
slope = "";
else
slope = teePointer.teeSlope;

if argument[4] == undefined
rating = "";
else
rating = teePointer.teeRating;

if argument[5] == undefined
par = "";
else
par = teePointer.teePar;

// set values
score_struct_pointer.teeData.teeColor = teeColor; // set tee color
score_struct_pointer.teeData.teeYardage = yardage; // set yardage
score_struct_pointer.teeData.teeSlope = slope; // set slope
score_struct_pointer.teeData.teeRating = rating; // set rating
score_struct_pointer.teeData.teePar = par; // set par
}
