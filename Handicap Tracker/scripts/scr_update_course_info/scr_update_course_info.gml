function scr_update_course_info(course_name) {
// update course details in score list when changing details in course list

course_edit_name = string_convert_upper(course_edit_name);

// if you changed the course name
//if course_name == course_edit_name
//exit;

var size = ds_list_size(master_score_list);
for(var i=0;i<size;i++) // loop through scores
	{
	var pointer = master_score_list[| i];
	var score_course = pointer[| score_data.course];
	
	if score_course == course_name
	pointer[| score_data.course] = course_edit_name;
	}
	
course_id[| course_data.name] = course_edit_name;
	
}
