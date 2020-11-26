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
	var score_name = scorelist_array[i].courseName; // get the score name

	for(var n=0;n<course_size;n++) // loop through scores
		{
		var course_pointer = courselist_array[n];
		var course_name = course_pointer.courseName;
		
		if score_name == course_name
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
	case course_sort.abc: array_sort_nested_struct(courselist_array,"courseName",true); break; // sort list
	case course_sort.frequency: array_sort_nested_struct(courselist_array,"frequency",false); break; // sort list
	case course_sort.favorite: array_sort_nested_struct(courselist_array,"favorite",true); break; // sort list
	}

}