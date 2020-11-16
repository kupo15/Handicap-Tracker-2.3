///@param upper
function scr_handicap_predict(upper) {

var diff_arr = ds_list_create();
var pos_start = 0; // max(0,rounds_played-round_selection);
var pos_end = min(rounds_played,round_selection)-1;

for(var i=pos_start;i<pos_end;i++) // loop through last x score list
	{
	var score_pointer = master_score_list[| i];
	var score_test = score_pointer[| score_data.score_];
	if score_test == "" // if blank
		{
		ds_list_delete(master_score_list,i);
		i --;
		pos_end --;
		continue;
		}
	
	var score_ = real(score_pointer[| score_data.score_]-score_pointer[| score_data.strokes]);
	var course_rating = real(score_pointer[| score_data.rating]);
	var course_slope = real(score_pointer[| score_data.slope]);
	
	var diff = score_-course_rating;
	var adj_diff = diff*113/course_slope;

//	show_debug_message(i);
	ds_list_add(diff_arr,adj_diff); // add last 19 diff to list
	}
	
// create a copy to test
var diff_arr_copy = ds_list_create();

var temp_handicap = ghin_index;

for(var n=0;n<150;n++)
	{
	ds_list_copy(diff_arr_copy,diff_arr); // copy score list

	// add a test score
	if upper
	var score_ = 60+n;
	else
	var score_ = 85-n;
	
	var course_rating = real(play_course_rating);
	var course_slope = real(play_course_slope);
	
	var diff = score_-course_rating;
	var adj_diff = diff*113/course_slope;

	ds_list_add(diff_arr_copy,adj_diff); // add test diff to list

	// sort the last 20 scores
	ds_list_sort(diff_arr_copy,true);

	var list_size = ds_list_size(diff_arr_copy);
	var ave = 0;
	var top_limit = min(list_size,top_scores); // limit to the top x scores

	for(var i=0;i<top_limit;i++)
		{
		show_debug_message(diff_arr_copy[| i]);
		ave += diff_arr_copy[| i];
		}
		
	var temp_handicap = ave/top_limit; // set predicative handicap
	
	show_debug_message("score: "+string(score_)+" - "+string(n)+"** "+string(round_tenth(temp_handicap)));
	// test conditions
	if upper
		{
		if round_tenth(temp_handicap) > round_tenth(ghin_index)
			{
			play_course_handicap_inc = score_;
			break;
			}
		}
	else
		{
		if round_tenth(temp_handicap) < round_tenth(ghin_index)
			{
			play_course_handicap_dec = score_;
			break;
			}
		}
	}

ds_list_destroy(diff_arr);
ds_list_destroy(diff_arr_copy);

show_debug_message("handicap_predicted");


}
