function scr_tee_filled_set(source_id) {
/// @param [source_id]	
	
if course_id == noone
exit;

if argument[0] == undefined
	{	
	var tee_pointer = course_id[| 1]; // tee marker MAP
			
	var size = ds_list_size(teebox_filled);
	for(var i=0;i<size;i++)
		{
		var tee_col = teebox_list[| i]; // get tee color
		var tee_data_pointer = tee_pointer[? tee_col];
		var course_yardage = tee_data_pointer[| tee_data.yardage];
	
		if course_yardage == ""
		teebox_filled[| i] = false;
		else
		teebox_filled[| i] = true;
		}
	}
else
	{
	var size = ds_list_size(teebox_filled);
	for(var i=0;i<size;i++)
		{
		var course_yardage = temp_tee_data[i][| tee_data.yardage];

		
		if course_yardage == ""
		teebox_filled[| i] = false;
		else
		teebox_filled[| i] = true;
		}
	}
	
}

function scr_tee_set() {
	
if course_id == noone
exit;

var tee_pointer = course_id[| 1]; // tee marker MAP

var size = ds_list_size(teebox_list);
for(var i=0;i<size;i++)
	{
	var tee_col = teebox_list[| i]; // get tee color
	var tee_data_pointer = tee_pointer[? tee_col];
	var course_yardage = tee_data_pointer[| tee_data.yardage];
	var course_slope = tee_data_pointer[| tee_data.slope];
	var course_rating = tee_data_pointer[| tee_data.rating];
	var course_par = tee_data_pointer[| tee_data.par];
		
	// set temp tee data from course
	temp_tee_data[i][| tee_data.yardage] = course_yardage;
	temp_tee_data[i][| tee_data.slope] = course_slope;
	temp_tee_data[i][| tee_data.rating] = course_rating;
	temp_tee_data[i][| tee_data.par] = course_par;
	
	}
}

function scr_tee_update(course_pointer, tee_ind, yardage, slope, rating, par) {
/// @param course_pointer
/// @param tee_color
/// @param yardage
/// @param slope
/// @param rating

	var tee_pointer_MAP = course_pointer[| 1];
	var tee_color = teebox_list[| tee_ind];
	var tee_data_pointer = tee_pointer_MAP[? tee_color];

	tee_data_pointer[| tee_data.yardage] = yardage; // set yardage
	tee_data_pointer[| tee_data.slope] = slope; // set slope
	tee_data_pointer[| tee_data.rating] = rating; // set rating
	tee_data_pointer[| tee_data.par] = par; // set par


}
