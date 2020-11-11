
function scr_score_add_index(c_name,tee_color,_score,date,strokes) {
/// @param course_name
/// @param tee_color
/// @param score
/// @param date
/// @param [strokes]

if argument[4] == undefined
strokes = "0";

var struct = course_find_struct(c_name);

if struct == undefined
	{
	show_message(string(c_name)+" not found > not adding score");
	exit;
	}

var teeData = variable_struct_get(struct.teeMap,tee_color);
var course_yardage = teeData.courseYardage;
var course_slope = teeData.courseSlope;
var course_rating = teeData.courseRating;
var course_par = teeData.coursePar;

// add score data
var score_struct = {

	courseName: c_name,
	teeColor: tee_color,
	courseSlope: course_slope,
	courseRating: course_rating,
	coursePar: course_par,
	
	roundScore: _score,
	roundStrokes: strokes,
	roundDate: date,
	
	courseHandicap: undefined,
	indexHistory: undefined,
	esr: 0,
	}	
cs(json_stringify(score_struct))
sm(score_struct)
rounds_played ++;

return struct;
}
