
function scr_score_create(course_name,tee_color,yardage,slope,rating,par,score,date,strokes) {

score_struct = {

	courseName: course_name,
	teeColor: tee_color,
	courseYardage: yardage,
	courseSlope: slope,
	courseRating: rating,
	coursePar: par,
	
	roundScore: score,
	roundStrokes: strokes,
	roundDate: date,
	
	courseHandicap: undefined,
	indexHistory: undefined,
	indexIncluded: true,
	practiceRound: false,
	esr: 0,
	}	

return score_struct;
}

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

// create score data
score_struct = scr_score_create(c_name,tee_color,course_yardage,course_slope,course_rating,course_par,_score,date,strokes);

// add score
array_push(scorelist_array,score_struct);
rounds_played ++;

return struct;
}
