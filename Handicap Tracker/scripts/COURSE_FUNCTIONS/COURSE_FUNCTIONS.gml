
function scr_course_create(name,state,district,starred,array) {
/// @param [name
/// @param stateInitial
/// @param district
/// @param favorite
/// @param arrayId]

if argument[0] == undefined
name = "";

if argument[2] == undefined
district = 0;

if argument[3] == undefined
starred = false;

// find location struct
var location_struct = pick(scr_course_location_find(state),state,state == undefined);

// create struct
course_struct = {
	
	courseName: name,
	courseLocation: location_struct,
	districtInd: district,
	
	favorite: starred,
	lastPlayed: undefined,
	frequency: 0,
	
	subcourses: [
		{
		name: name,
		}
		]
		
	}
		
// add to master courselist
if argument[4] != undefined
array_push(array,course_struct);

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
variable_struct_set(struct.subcourses[subcourse_index],string_lower(teeColor),tee);
}

function scr_course_tee_set(teeCol) {
	
var tee_struct = variable_struct_get(activeStruct.subcourses[subcourse_index],string_lower(teeCol));

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
	
function course_find_struct(courseName,struct) {
/// @param courseName		
/// @param [sourceStruct]
		
if argument[1] == undefined
struct = courselist_struct
		
return variable_struct_get(struct,courseName);	
}

function course_find_array(courseName,array) {
/// @param courseName		
/// @param [sourceArray]
		
if argument[1] == undefined
array = courselist_array
		
// loop through course list
var size = array_length(array);
for(var i=0;i<size;i++)
	{
	var struct = array[i];
	var name = struct.courseName;
	
	if name == courseName
		{
		course_index = i;
		return struct;
		}
	}
	
return undefined;
}