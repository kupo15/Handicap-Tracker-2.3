function scr_update_course_frequency() {
// update course details in score list when changing details in course list

// clear course frequency
var course_size = array_length(courselist_array);
for(var i=0;i<course_size;i++) // loop through scores
courselist_array[i].frequency = 0;
	
// set course frequency
var score_size = array_length(scorelist_array);
for(var i=0;i<score_size;i++) // loop through scores
	{
	var score_courseId = scorelist_array[i].courseID; // get the score courseId

	for(var n=0;n<course_size;n++) // loop through courses
		{
		var course_pointer = courselist_array[n];
		var course_id = course_pointer.courseID;
		
		if score_courseId == course_id
			{
			course_pointer.frequency ++; // add to count
			break;
			}
		}
	}
}

function scr_course_list_sort(ind) {
	
META_data.courseSort = ind; // update header preferences

switch ind
	{
	case course_sort.abc: coursesort; break; // sort list
	
	case course_sort.frequency: scr_update_course_frequency();
								array_sort_nested_struct(courselist_array,"frequency",false); 
								break; // sort list
	
	case course_sort.favorite: coursesort;
							   array_sort_nested_struct(courselist_array,"favorite",false);
							   break; // sort list
	}

}

function scr_score_list_sort(ind) {
	
META_data.scoreSort = ind; // update header preferences
exit;

switch ind
	{
	case score_sort.currentYear: array_sort_nested_struct(scorelist_array,"courseName",true); break; // sort list
	case score_sort.lastYear: array_sort_nested_struct(scorelist_array,"frequency",false); break; // sort list
	case score_sort.allScores: array_sort_nested_struct(scorelist_array,"offSeason",false); break; // sort list
	}

}