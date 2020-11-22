function scr_stats_set() {

var course_name = course_struct.courseName; // course selected for stats

var size = ds_list_size(teebox_list);
for(var i=0;i<size;i++) // loop through tee stats
ds_list_clear(stat_tee[i]); // clear the tee score list	

var size = array_length(scorelist_array);
for(var i=0;i<size;i++) // loop through scores
	{
	var pos = size-1-i;
	var score_pointer = scorelist_array[pos]; // get course pointer
	var course = score_pointer.courseName; // get the name
	
	// find a match is found
	if course == course_name
		{
		var _score = score_pointer.roundScore; // get the score
		var tee_color = capitalize(score_pointer.teeColor); // get tee color
		var tee_ind = ds_list_find_index(teebox_list,tee_color); // get the tee index
		
		ds_list_add(stat_tee[tee_ind],real(_score)); // add the score to the list
		}
	}

// scr_tee_filled_set();


}
