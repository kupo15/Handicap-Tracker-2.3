
function scr_course_add_index(name,tee,yardage,slope,rating,par) {
/// @param [name
/// @param tee
/// @param yardage
/// @param slope
/// @param rating
/// @param par]

if argument_count == 0
	{
	name = "";
	tee = noone;
	yardage = undefined;
	slope = undefined;
	rating = undefined;
	par = undefined;
	}

var index = find_index(name,master_course_list);

if index != noone
	{
	var course_pointer = master_course_list[| index];
	scr_tee_update(course_pointer,tee,yardage,slope,rating,par);
	exit;
	}

var course_pointer = ds_list_create_nest(master_course_list); // create course

// add course data
ds_list_add(course_pointer,name); // add course name

var tee_pointer_MAP = ds_map_create();
ds_list_add(course_pointer,tee_pointer_MAP); // add tee list pointer MAP to course pointer list
ds_list_mark_as_map(course_pointer,1); // mark as map

// add teebox pointer
var size = ds_list_size(teebox_list); // number of teeboxes
for(var i=0;i<size;i++)
	{
	var tee_str = teebox_list[| i]; // get the color of the tee marker
	
	var tee_data_pointer = ds_list_create(); // create the teebox data list
	ds_map_add_list(tee_pointer_MAP,string(tee_str),tee_data_pointer); // add teebox pointer to tee MAP
	
	// add data
	ds_list_add(tee_data_pointer,yardage); // yardage
	ds_list_add(tee_data_pointer,slope); // slope
	ds_list_add(tee_data_pointer,rating); // rating
	ds_list_add(tee_data_pointer,par); // par

	if tee != i // clear out the tee that isn't being set via the argument
		{
		tee_data_pointer[| 0] = ""; // yardage
		tee_data_pointer[| 1] = ""; // slope
		tee_data_pointer[| 2] = ""; // rating
		tee_data_pointer[| 3] = ""; // par
		}
	}
	
return ds_list_size(master_course_list)-1;



}


function scr_course_create(name,array) {
/// @param [name]
/// @param [array]

if argument[0] == undefined
name = "";

if argument[1] == undefined
array = courselist_array;

active_course = {
	
	courseName: name,
	teeMap: {},

	}
	
// add to master courselist
if array != undefined
scr_course_add_array(array,active_course);

return active_course;
}

function scr_course_add_array(array,courseStruct) {
	
array_push(array,courseStruct);	
}

function scr_course_add_struct(destStruct,courseStruct,courseName) {
	
variable_struct_set(destStruct,courseName,courseStruct);	
}

function scr_course_add_tee(courseName,teeColor,yardage,slope,rating,par) {
	
// create tee struct
var tee = {
	
	courseYardage: yardage,
	courseSlope: slope,
	courseRating: rating,
	coursePar: par,
	}

// add tee color data to active course's teeMap
variable_struct_set(active_course.teeMap,teeColor,tee);


// add to course
//var struct = course_find_array(courseName);
/*
if struct != undefined
variable_struct_set(active_course.teeMap,teeColor,tee);
else
sm("course not found");*/
}

