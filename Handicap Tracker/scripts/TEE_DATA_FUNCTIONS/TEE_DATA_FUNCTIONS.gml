function scr_tee_filled_set(source_id) {
/// @param [source_id]	

if argument[0] == undefined
source_id = course_struct;

var tee_pointer = source_id.subcourses[subcourse_index]; // tee marker MAP
var size = ds_list_size(teebox_filled);

for(var i=0;i<size;i++)
	{
	var tee_col = teebox_list[| i]; // get tee color
	var tee_data_pointer = variable_struct_get(tee_pointer,string_lower(tee_col));

	teebox_filled[| i] = (tee_data_pointer != undefined);
	}	
}

function scr_score_tee_update(score_struct_pointer,course_struct_pointer,teeColor,yardage,slope,rating,par) {
/// @param score_struct_pointer
/// @param course_struct_pointer
/// @param tee_color
/// @param [yardage
/// @param slope
/// @param rating
/// @param par]

var teePointer = variable_struct_get(course_struct_pointer.subcourses[subcourse_index],string_lower(teeColor));

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
