
function scr_handicap_predict(starting_score,upper) {

var diff_arr = ds_list_create();

var pos_start = 0;
var pos_end = min(rounds_played,round_selection)-1;
for(var i=pos_start;i<pos_end;i++) // loop through last x score list
	{
	var score_pointer = scorelist_array[i];
	var score_test = score_pointer.roundScore;
	
	if score_test == "" // if blank
		{// remove scores that have no scores
		array_delete(scorelist_array,i,1);
		i --;
		pos_end --;
		continue;
		}
		
	// add last 19 diff to list
	var round_score = real(score_test);
	var round_strokes = real(score_pointer.roundStrokes);
	var course_rating = real(score_pointer.teeRating);
	var course_slope = real(score_pointer.teeSlope);
	
	var net_score = round_score-round_strokes;
	var diff = net_score-course_rating;
	var adj_diff = diff*113/course_slope;

	ds_list_add(diff_arr,adj_diff); 
	}
	
// create a copy to test
var diff_arr_copy = ds_list_create();
var temp_handicap = ghin_index;

// test values
for(var n=0;n<150;n++)
	{
	ds_list_copy(diff_arr_copy,diff_arr); // copy score list

	// add a test score
	var net_score = pick(starting_score-n,starting_score+n,upper);
	var course_rating = real(play_course_struct.teeRating);
	var course_slope = real(play_course_struct.teeSlope);
	
	var diff = net_score-course_rating;
	var adj_diff = diff*113/course_slope;

	ds_list_add(diff_arr_copy,adj_diff); // add test diff to list

	// sort the last 20 scores
	ds_list_sort(diff_arr_copy,true);

	var list_size = ds_list_size(diff_arr_copy);
	var top_limit = min(list_size,top_scores); // limit to the top x scores
	var ave = 0;

	for(var i=0;i<top_limit;i++)
		{
		//db(diff_arr_copy[| i]);
		ave += diff_arr_copy[| i];
		}

	var temp_handicap = round_tenth(ave/top_limit); // set predicative handicap	
	
	//db("score: "+string(net_score)+" - "+string(n)+"** "+string(temp_handicap));

	// test conditions
	if upper
		{
		if temp_handicap > round_tenth(ghin_index)
			{
			var struct = falling_off_struct_get();
			
			play_course_struct.handicap_inc = pick("Free Round",net_score,struct.indexIncluded);			
			break;
			}
		}
	else
		{
		if temp_handicap < round_tenth(ghin_index)
			{
			play_course_struct.handicap_dec = net_score;
			break;
			}
		}
	}

ds_list_destroy(diff_arr);
ds_list_destroy(diff_arr_copy);

show_debug_message("handicap_predicted");


}
