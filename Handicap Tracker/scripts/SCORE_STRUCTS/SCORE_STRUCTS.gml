
function scr_score_create(course_name,course_state,tee_color,yardage,slope,rating,par,score,date,strokes,off_season) {
/// @param [course_name
/// @param stateInitial
/// @param tee_color
/// @param yardage
/// @param slope
/// @param rating
/// @param par
/// @param score
/// @param date
/// @param strokes
/// @param off_season]

#region optional undefines
if argument[0] == undefined
course_name = "";

if argument[1] == undefined
course_state = "";

if argument[2] == undefined
tee_color = "";

if argument[3] == undefined
yardage = "";

if argument[4] == undefined
slope = "";

if argument[5] == undefined
rating = "";

if argument[6] == undefined
par = "";

if argument[7] == undefined
score = "";

if argument[8] == undefined
date = date_current_datetime();

if argument[9] == undefined
strokes = "";

if argument[10] == undefined
off_season = false;
#endregion

score_struct = {

	courseID: -1,
	courseName: course_name,
	adjDiff: undefined,

	teeData: {
		teeColor: tee_color,
		teeYardage: yardage,
		teeSlope: slope,
		teeRating: rating,
		teePar: par,
		},
	
	roundData: {
		grossScore: score,
		netScore: -1,
		roundStrokes: strokes,
		roundDate: date,		
		},
	
	courseLocation: {},
	
	handicapData: {
		indexHistory: -1,
		indexIncluded: false,
		
		adjDiff: -1,
		courseHandicap: -1,
		esr: 0,

		offSeason: off_season,
		roundType: round_Type.normal,
		
		handicap_inc: "",
		handicap_dec: "",
		}
	}
	
	
var struct = course_find_array(course_name,course_state,COURSE_database); // course struct

if struct != undefined
	{
	var districtIndex = struct.districtInd;
	var location_struct = struct.courseLocation;
	var district_struct = location_struct.districts[districtIndex];

	score_struct.courseID = struct.courseID;
	score_struct.districtInd = districtIndex;
	score_struct.courseLocation = location_struct;
	//score_struct.courseLocation = district_struct;
	//score_struct.courseLocation.stateName = location_struct.stateName;
	//score_struct.courseLocation.stateInitial = location_struct.stateInitial;
	}

return score_struct;
}

function scr_score_add_index(c_name,c_state,tee_color,_score,date,strokes) {
/// @param course_name
/// @param state_initial
/// @param tee_color
/// @param gross_score
/// @param date
/// @param [strokes]

if argument[5] == undefined
strokes = "0";

var struct = course_find_array(c_name,c_state,COURSE_database); // course struct

if struct == undefined
	{
	sm(string(c_name)+" not found > not adding score");
	exit;
	}

var teeData = variable_struct_get(struct.subcourses[subcourse_index].teeData,tee_color);

if teeData == undefined
	{	
	sm(string(c_name)+" "+string(tee_color)+" tees not found > not adding score");
	exit;
	}
	
// create score	
var districtIndex = struct.districtInd;
var location_struct = struct.courseLocation;
var district_struct = location_struct.districts[districtIndex];
var allYear = district_struct.yearRound;

// all season
if allYear
var off_season = false;
else
	{
	var startDate = district_struct.startSeason;
	var endDate = district_struct.endSeason;
	
	var off_season = date_within(date,startDate,endDate,true);

	//sm(c_name + " :"+string(off_season))
	}

// get tee data
var course_yardage = teeData.teeYardage;
var course_slope = teeData.teeSlope;
var course_rating = teeData.teeRating;
var course_par = teeData.teePar;

// create score data
score_struct = scr_score_create(c_name,c_state,tee_color,course_yardage,course_slope,course_rating,course_par,_score,date,strokes,off_season);

// add score
array_push(scorelist_array,score_struct);
rounds_played ++;

return struct;
}
