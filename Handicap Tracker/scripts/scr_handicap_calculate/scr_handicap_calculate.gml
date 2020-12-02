function scr_handicap_calculate() {

var index_history = undefined;
var diff_arr = ds_list_create();

scoresort;
included_scores_array = []; // clear

// calculate practice rounds
var size = array_length(scorelist_array);
for(var i=0;i<size;i++) // loop through all
	{
	var score_pointer = scorelist_array[i];
	var handicap_pointer = score_pointer.handicapData;
	var round_pointer = score_pointer.roundData;
	var tee_pointer = score_pointer.teeData;
	
	var gross_score = round_pointer.grossScore;
	var _strokes = round_pointer.roundStrokes;
	
	if _strokes == ""
	_strokes = 0;
	
	// if blank
	if gross_score == ""
		{
		array_delete(scorelist_array,i,1);
		i --;
		size --;
		continue;
		}

	var net_score = real(gross_score)-real(_strokes);
	var course_rating = real(tee_pointer.teeRating);
	var course_slope = real(tee_pointer.teeSlope);
	var course_par = real(tee_pointer.teePar);
	var practice = handicap_pointer.roundType;
	var off_season = handicap_pointer.offSeason;
	
	// calc diff
	var diff = net_score-course_rating;
	var adj_diff = diff*113/course_slope;

	// set values in struct
	round_pointer.netScore = net_score;
	
	score_pointer.adjDiff = adj_diff; // remove
	
	handicap_pointer.indexIncluded = false;
	handicap_pointer.adjDiff = adj_diff;
	handicap_pointer.esr = 0;
	handicap_pointer.courseHandicap = undefined;

	if (practice != round_Type.practice) && !off_season
	array_push(included_scores_array,score_pointer);
	}

scr_score_sort(included_scores_array,true);

// calculate handicaps
var index_prev = undefined;
var num = array_length(included_scores_array);
for(var n=0;n<num;n++) // loop through all included scores
	{
	//db("*****Handicap Start******");
	ds_list_clear(diff_arr);
	
	var pos_start = n;
	var pos_end = max(n-round_selection,-1);
	for(var i=pos_start;i>pos_end;i--) // loop back through last up to 20 scores
		{
		ds_list_add(diff_arr,included_scores_array[i]); // add up to last 20 score structs
		//db(included_scores_array[i].courseName);
		}
			
	// sort diff list lowest to highest
	ds_list_sort_nested_struct(diff_arr,"adjDiff",true);

	// calculate index
	var ave = 0;
	var list_size = ds_list_size(diff_arr); // up to 20 scores
	var top_limit = min(top_scores,list_size); // up to top 8 scores
	
	for(var i=0;i<top_limit;i++)
		{
		//db(diff_arr[| i].courseName+": "+string(round_tenth(diff_arr[| i].adjDiff)));
		ave += diff_arr[| i].adjDiff;
		}
		
	var score_pointer = included_scores_array[n];
	var index_history = clamp(round_tenth(ave/top_limit),-20,54);
	
	score_pointer.handicapData.indexHistory = index_history; // set the index up to this point

	// set course handicap at this point
	if index_prev != undefined
		{
		var course_handicap = scr_course_handicap(index_prev,course_slope,course_rating,course_par);
		score_pointer.handicapData.courseHandicap = course_handicap;
		}
		
	var index_prev = index_history;
	}

ghin_index = index_history; // set current index
PROFILE_data.index = ghin_index;


var rounds_included = array_length(included_scores_array);

		// set ESR
	/*	var esr_test = 0;
		
		if score_ <= course_par+course_handi-10 // if shot 10 or better strokes than expected
		esr_test = 2;
		else if score_ <= course_par+course_handi-7 // if shot 7 or better strokes than expected
		esr_test = 1;

		if esr_test != 0 // an esr reduction is in effect
			{
			var esr_start = n+1;
			var esr_end = min(n+round_selection,rounds_included);

			for(var a=esr_start;a<esr_end;a++)
			score_pointer[| score_data.esr] += esr_test;
			}*/


// set recent scores
recent_scores_array = [];

scr_score_sort(included_scores_array,false);

// add last 20 score structs

var size = min(rounds_included,round_selection);
for(var i=0;i<size;i++)
array_push(recent_scores_array,included_scores_array[i]);

// recent score sort
array_sort_nested_struct(recent_scores_array,"adjDiff",true); // best to worst
	
// set the first 8 scores to active
var num = min(top_scores,rounds_included)
for(var i=0;i<num;i++)
recent_scores_array[i].handicapData.indexIncluded = true; // index

// sorting
scr_score_sort(recent_scores_array,false);

// cleanup
ds_list_destroy(diff_arr);

// debug
db("handicap index calculated");
db(ghin_index);


}
