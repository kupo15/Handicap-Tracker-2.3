
function scr_score_create(course_name,tee_color,yardage,slope,rating,par,score,date,strokes,off_season) {
/// @param [course_name
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
tee_color = "";

if argument[2] == undefined
yardage = "";

if argument[3] == undefined
slope = "";

if argument[4] == undefined
rating = "";

if argument[5] == undefined
par = "";

if argument[6] == undefined
score = "";

if argument[7] == undefined
date = date_current_datetime();

if argument[8] == undefined
strokes = "0";

if argument[9] == undefined
off_season = false;
#endregion

score_struct = {

	courseID: undefined,
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
		netScore: undefined,
		roundStrokes: strokes,
		roundDate: date,		
		},
	
	courseLocation: undefined,
	
	handicapData: {
		indexHistory: undefined,
		indexIncluded: false,
		
		courseHandicap: undefined,
		esr: 0,

		offSeason: off_season,
		roundType: 1,
		
		handicap_inc: "",
		handicap_dec: "",
		}
	}	

return score_struct;
}

function scr_score_add_index(c_name,tee_color,_score,date,strokes) {
/// @param course_name
/// @param tee_color
/// @param gross_score
/// @param date
/// @param [strokes]

if argument[4] == undefined
strokes = "0";

var struct = course_find_array(c_name,COURSE_database); // course struct

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
score_struct = scr_score_create(c_name,tee_color,course_yardage,course_slope,course_rating,course_par,_score,date,strokes,off_season);
score_struct.courseLocation = district_struct;
score_struct.courseID = struct.courseID;

//cs(js(score_struct));
//sm(score_struct)


// add score
array_push(scorelist_array,score_struct);
rounds_played ++;

return struct;
}
