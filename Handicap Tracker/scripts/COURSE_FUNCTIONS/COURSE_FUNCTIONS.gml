
function scr_course_add_local(course_id,array) {
/// add to local courselist_array
/// @param courseID
/// @param [destinationArray]

if argument[1] == undefined
array = courselist_array;

// create struct
var local_struct = {
	
	courseID: course_id,
	favorite: false,
	lastPlayed: undefined,
	frequency: 0,		
	}
	
array_push(array,local_struct);
		
return local_struct;
}

function scr_course_create_database(name,state,district,arr) {
	
/// @param [name
/// @param stateInitial
/// @param district
/// @param array]

if argument[0] == undefined
name = "";

if argument[2] == undefined
district = 0;

if argument[3] == undefined
arr = COURSE_database;

// find location struct
var location_struct = pick(scr_course_location_find(state),state,state == undefined);
var ind = array_length(arr);	

// create struct
course_struct = {
	
	courseID: ind,
	courseName: name,
	courseLocation: location_struct,
	districtInd: district,
	
	subcourses: [
		{
		teeData: {},
		name: name,
		}
		]
		
	}
	
// add to master courselist database
if argument[3] != undefined
	{
	array_push(arr,course_struct); // push to database list
	//array_push(COURSE_data,ind); // push to local courselist array
	}
		
return course_struct;	
}

function scr_course_add_tee(struct,teeColor,yardage,slope,rating,par,date) {
/// @param struct
/// @param teeColor
/// @param [yardage
/// @param slope
/// @param rating
/// @param par
/// @param date]

if argument[2] == undefined
yardage = "";

if argument[3] == undefined
slope = "";

if argument[4] == undefined
rating = "";

if argument[5] == undefined
par = "";

if argument[6] == undefined
date = start_date;

// create tee struct
var tee = {
	
	dateCreated: date,
	teeYardage: yardage,
	teeSlope: slope,
	teeRating: rating,
	teePar: par,
	}

// add tee color data to active course's teeMap
variable_struct_set(struct.subcourses[subcourse_index].teeData,string_lower(teeColor),tee);
}

function scr_course_tee_set(teeCol) {
	
var tee_struct = variable_struct_get(activeStruct.subcourses[subcourse_index].teeData,string_lower(teeCol));

// create new tee
if tee_struct == undefined
scr_course_add_tee(activeStruct,teeCol);
}
	
function scr_course_location_find(state_name,district) {
/// @param stateInitial
/// @param [districtInd]

if argument[1] == undefined
district = 0;

var list_size = array_length(handicap_season_array);
for(var i=0;i<list_size;i++)
	{
	var pointer = handicap_season_array[i];
	var check_state_abbrev = pointer.stateInitial;
	
	if state_name == check_state_abbrev
	return pointer;	
	}

return undefined;
}
	
function course_find_array(courseName,courseState,array) {
/// @param courseName	
/// @param stateInitial
/// @param [sourceArray]
		
if argument[2] == undefined
array = courselist_array
		
// loop through course list
var size = array_length(array);
for(var i=0;i<size;i++)
	{
	var struct = array[i];
	var name = struct.courseName;
	var state = struct.courseLocation.stateInitial;
	
	if (name == courseName) && (state == courseState)
		{
		course_index = i;
		return struct;
		}
	}
	
return undefined;
}
	
function scr_course_sort(source_array,ascending) {

// create temp sorting grid
var sorting_grid = ds_grid_create(2,0);

// add data to grid
var size = array_length(source_array);
for(var i=0;i<size;i++)
	{
	var pointer = source_array[i];
	var courseId = pointer.courseID;
	var sort_value = database_course_get_pointer(courseId,"courseName");

	// debug
	if sort_value == undefined
		{
		sm("course key undefined >> not sorted");
		exit;
		}

	grid_row_add(sorting_grid); // add a row to the temp sorting grid
	sorting_grid[# 0,i] = pointer; // add list pointer to grid
	sorting_grid[# 1,i] = sort_value; // add value to sort to grid
	}
	
// sort grid
ds_grid_sort(sorting_grid,1,ascending); 

// re add pointers back to the source array
for(var i=0;i<size;i++)
source_array[@ i] = sorting_grid[# 0,i];

// destroy temp sorting grid
ds_grid_destroy(sorting_grid);	
}

function scr_score_sort(source_array,ascending) {

// create temp sorting grid
var sorting_grid = ds_grid_create(2,0);

// add data to grid
var size = array_length(source_array);
for(var i=0;i<size;i++)
	{
	var pointer = source_array[i];
	var sort_value = variable_struct_get(pointer.roundData,"roundDate");

	// debug
	if sort_value == undefined
		{
		sm("score key undefined >> not sorted");
		exit;
		}

	grid_row_add(sorting_grid); // add a row to the temp sorting grid
	sorting_grid[# 0,i] = pointer; // add list pointer to grid
	sorting_grid[# 1,i] = sort_value; // add value to sort to grid
	}
	
// sort grid
ds_grid_sort(sorting_grid,1,ascending); 

// re add pointers back to the source array
for(var i=0;i<size;i++)
source_array[@ i] = sorting_grid[# 0,i];

// destroy temp sorting grid
ds_grid_destroy(sorting_grid);	
}