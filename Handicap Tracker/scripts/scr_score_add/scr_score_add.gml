
function scr_score_add(course_name,tee,yardage,slope,rating,par,_score,date,strokes) {

	var ind = ds_list_size(master_score_list);
	var list = ds_list_create(); // create a score list
	ds_list_add(master_score_list,list); // add score to master score list
	ds_list_mark_as_list(master_score_list,ind); // mark master score list entry as list

	if strokes == undefined
	strokes = "0";

	// add score data
	ds_list_add(list,course_name);
	ds_list_add(list,tee);
	ds_list_add(list,yardage);
	ds_list_add(list,slope);
	ds_list_add(list,rating);
	ds_list_add(list,par);
	ds_list_add(list,_score);
	ds_list_add(list,date);
	ds_list_add(list,strokes);
	ds_list_add(list,"-4"); // course handicap
	ds_list_add(list,"-4"); // index history
	ds_list_add(list,0); // esr

	return ind;


}
