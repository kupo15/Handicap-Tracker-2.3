
function scr_score_add_index(c_name,tee_color,_score,date,strokes) {
/// @param course_name
/// @param tee_color
/// @param score
/// @param date
/// @param [strokes]

if argument[4] == undefined
strokes = "0";

var struct = course_find_array(c_name);

if struct == undefined
	{
	db(string(c_name)+" not found > not adding score");
	exit;
	}
	
var teeData = variable_struct_get(struct.subcourses[0],tee_color);

if teeData == undefined
	{	
	show_message(string(c_name)+" "+string(tee_color)+" tees not found > not adding score");
	exit;
	}

var course_yardage = teeData.courseYardage;
var course_slope = teeData.courseSlope;
var course_rating = teeData.courseRating;
var course_par = teeData.coursePar;

// add score data
var score_struct = {

	courseName: c_name,
	teeColor: tee_color,
	courseYardage: course_yardage,
	courseSlope: course_slope,
	courseRating: course_rating,
	coursePar: course_par,
	
	roundScore: _score,
	roundStrokes: strokes,
	roundDate: date,
	
	courseHandicap: undefined,
	indexHistory: undefined,
	indexIncluded: false,
	practiceRound: false,
	esr: 0,
	}	

array_push(scorelist_array,score_struct);
rounds_played ++;

return struct;
}
