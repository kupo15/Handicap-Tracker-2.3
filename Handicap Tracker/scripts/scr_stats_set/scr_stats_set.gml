function scr_stats_set() {

stat_tee_index = 0; // reset
statslist_array = []; // clear array

var score_array_copy = [];
var size = array_length(SCORE_data);

array_copy(score_array_copy,0,SCORE_data,0,size);

// compile the stats array
var for(var i=0;i<size;i++)
	{
	var score_pointer = score_array_copy[i];
	var course_id = score_pointer.courseID;
	var course_name = score_pointer.courseName;
		
	// create struct
	var stat_struct = {
		
	courseID: course_id,
	courseName: course_name,
	
	teeData: {},
		
	}

	var round_pointer = score_pointer.roundData;
	
	var tee_pointer = score_pointer.teeData;
	var tee_color = tee_pointer.teeColor;

	stat_struct.teeData[$ tee_color] = [];
	array_push(stat_struct.teeData[$ tee_color],round_pointer); // add round score to array
		
	array_push(statslist_array,stat_struct); // add to stats array

	// loop through rest of the list
	for(var n=i+1;n<size;n++)
		{
		var cull_pointer = score_array_copy[n];
		var cull_course_id = cull_pointer.courseID;
		
		if course_id == cull_course_id // if a match
			{
			var round_pointer = cull_pointer.roundData;
	
			var tee_pointer = cull_pointer.teeData;
			var tee_color = tee_pointer.teeColor;
			
			if variable_struct_get(stat_struct.teeData,tee_color) == undefined // if tee color doesn't exsist
			stat_struct.teeData[$ tee_color] = []; // create tee
			
			// add round score to array
			array_push(stat_struct.teeData[$ tee_color],round_pointer); 

			// cull 
			array_delete(score_array_copy,n,1); // cull
			n --;
			size --;
			}
		}
	}
	
// destroy temp array
score_array_copy = undefined;	
exit;

cs(js(statslist_array[1]))
sm(statslist_array[1])

var course_name = course_struct.courseName; // course selected for stats

var size = ds_list_size(teebox_list);
for(var i=0;i<size;i++) // loop through tee stats
ds_list_clear(stat_tee[i]); // clear the tee score list	

var size = array_length(scorelist_array);
for(var i=0;i<size;i++) // loop through scores
	{
	var pos = size-1-i;
	var score_pointer = scorelist_array[pos]; // get course pointer
	var round_pointer = score_pointer.roundData;
	var tee_pointer = score_pointer.teeData;
	
	var course = score_pointer.courseName; // get the name
	
	// find a match is found
	if course == course_name
		{
		var net_score = round_pointer.netScore; // get the score
		var tee_color = capitalize(tee_pointer.teeColor); // get tee color
		var tee_ind = ds_list_find_index(teebox_list,tee_color); // get the tee index
		
		ds_list_add(stat_tee[tee_ind],real(net_score)); // add the score to the list
		}
	}

// scr_tee_filled_set();
if array_length(courselist_array) > 0
						   {
						   course_struct = courselist_array[stat_index];					 
						   scr_stats_set();
						   }

}
