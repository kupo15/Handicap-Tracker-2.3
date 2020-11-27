
function scr_score_create(course_name,tee_color,yardage,slope,rating,par,score,date,strokes,season) {

var int = argument[9];

score_struct = {

	courseName: course_name,
	teeColor: tee_color,
	teeYardage: yardage,
	teeSlope: slope,
	teeRating: rating,
	teePar: par,
	
	roundScore: score,
	roundStrokes: strokes,
	roundDate: date,
	
	courseHandicap: undefined,
	indexHistory: undefined,
	indexIncluded: false,
	practiceRound: false,
	offSeason: season,
	esr: 0,
	}	

return score_struct;
}

function scr_score_add_index(c_name,tee_color,_score,date,strokes,season) {
/// @param course_name
/// @param tee_color
/// @param score
/// @param date
/// @param [strokes
/// @param offSeason]

if argument[4] == undefined
strokes = "0";

if argument[5] == undefined
season = false;

var struct = course_find_array(c_name);

if struct == undefined
	{
	sm(string(c_name)+" not found > not adding score");
	exit;
	}
	
var teeData = variable_struct_get(struct.subcourses[subcourse_index],tee_color);

if teeData == undefined
	{	
	sm(string(c_name)+" "+string(tee_color)+" tees not found > not adding score");
	exit;
	}

var course_yardage = teeData.teeYardage;
var course_slope = teeData.teeSlope;
var course_rating = teeData.teeRating;
var course_par = teeData.teePar;

// create score data
score_struct = scr_score_create(c_name,tee_color,course_yardage,course_slope,course_rating,course_par,_score,date,strokes,season);

// add score
array_push(scorelist_array,score_struct);
rounds_played ++;

return struct;
}
