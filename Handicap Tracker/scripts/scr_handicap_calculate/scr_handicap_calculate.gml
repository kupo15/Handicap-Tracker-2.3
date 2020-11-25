function scr_handicap_calculate() {

var index_history = undefined;
var diff_arr = ds_list_create();

ds_list_clear(included_scores);

// calculate practice rounds
var size = array_length(scorelist_array);
for(var i=0;i<size;i++) // loop through all
	{
	var score_pointer = scorelist_array[i];
	var gross_score = score_pointer.roundScore;
	var _strokes = score_pointer.roundStrokes;
	
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
	var course_rating = real(score_pointer.teeRating);
	var course_slope = real(score_pointer.teeSlope);
	var course_par = real(score_pointer.teePar);
	var practice = score_pointer.practiceRound;
	
	// calc diff
	var diff = net_score-course_rating;
	var adj_diff = diff*113/course_slope;

	// set values in struct
	score_pointer.netScore = net_score;
	score_pointer.adjDiff = adj_diff;
	score_pointer.indexIncluded = false;
	score_pointer.esr = 0;
	score_pointer.courseHandicap = undefined;
	
	if !score_pointer.practiceRound
	ds_list_add(included_scores,score_pointer);
	}

ds_list_sort_nested_struct(included_scores,"roundDate",true); // included score sort oldest first

// calculate handicaps
var index_prev = undefined;
var rounds_included = ds_list_size(included_scores);
var num = clamp(rounds_included-round_selection+1,1,rounds_included); // number of rounds to calculate

var num = ds_list_size(included_scores);
for(var n=0;n<num;n++) // loop through all included scores
	{
	db("********************");
	ds_list_clear(diff_arr);
	
	var pos_start = n;
	var pos_end = max(n-round_selection,-1);
	for(var i=pos_start;i>pos_end;i--) // loop back through last up to 20 scores
		{
		ds_list_add(diff_arr,included_scores[| i]); // add up to last 20 score structs
		//db(included_scores[| i].courseName);
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
		
	var score_pointer = included_scores[| n];
	var index_history = clamp(round_tenth(ave/top_limit),-20,54);
	
	score_pointer.indexHistory = index_history; // set the index up to this point

	// set course handicap at this point
	if index_prev != undefined
		{
		var course_handicap = scr_course_handicap(index_prev,course_slope,course_rating,course_par);
		score_pointer.courseHandicap = course_handicap;
		}
		
	var index_prev = index_history;
	}

ghin_index = index_history; // set current index

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
ds_list_clear(recent_scores_list);
ds_list_sort_nested_struct(included_scores,"roundDate",false); // included score sort recent first

// add last 20 score structs
var size = min(rounds_included,round_selection);
for(var i=0;i<size;i++)
ds_list_add(recent_scores_list,included_scores[| i]);

// recent score sort
ds_list_sort_nested_struct(recent_scores_list,"adjDiff",true); // best to worst
	
// set the first 8 scores to active
var num = min(top_scores,rounds_included)
for(var i=0;i<num;i++)
recent_scores_list[| i].indexIncluded = true; // index

// sorting
ds_list_sort_nested_struct(recent_scores_list,"roundDate",false); // date sort recent scores recent first

// cleanup
ds_list_destroy(diff_arr);

// debug
db("handicap index calculated");
db(ghin_index);


}
