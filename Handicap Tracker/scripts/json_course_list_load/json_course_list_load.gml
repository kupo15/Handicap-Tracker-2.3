/// @param root_map
function json_course_list_load(argument0) {

	var root_map = argument0;

	var _version = root_map[? "Version"]; // get version number

	if _version != json_version
		{
		// exit;
		}

	var score_list = root_map[? "score list"];
	var size = ds_list_size(score_list); // number of scores
	for(var i=0;i<size;i++)
		{
		var data = score_list[| i];
		var name = data[| score_data.course];
		var tee = data[| score_data.tee];
		var yardage = data[| score_data.yardage];
		var slope = data[| score_data.slope];
		var rating = data[| score_data.rating];
		var par = data[| score_data.par];
		var _score = data[| score_data.score_];
		var date = data[| score_data.date];
		var strokes = data[| score_data.strokes];
	
		scr_score_add(name,tee,yardage,slope,rating,par,_score,date,strokes);
		}

	var course_list = root_map[? "course list"];
	var size = ds_list_size(course_list); // number of courses
	for(var i=0;i<size;i++)
		{
		var pointer = course_list[| i];
		var course_name = pointer[| 0]; // course name
		var tee_MAP = pointer[| 1]; // pointer to the tee data MAP

		var tee_data_pointer = scr_course_add(course_name); // create the course with empty tees and name only
	
		var tee_marker_size = ds_list_size(teebox_list);
		for(var t=0;t<tee_marker_size;t++) // loop through tee marker list
			{
			var tee_color = teebox_list[| t]; // get tee color
			var teeData = tee_MAP[? string(tee_color)]; // tee data
			var yardage = teeData[| 0];
			var slope = teeData[| 1];
			var rating = teeData[| 2];
			var par = teeData[| 3];

			scr_course_teebox_add(tee_data_pointer,tee_color,yardage,slope,rating,par);
			}
		}
	
	// play course saved data	
	play_course_index = if_undef(root_map[? "playing_course_index"],noone);
	play_course_id = if_undef(master_course_list[| play_course_index],noone);
	play_course_name = if_undef(root_map[? "playing_course_name"],"");
	play_course_teebox = if_undef(root_map[? "playing_teebox"],noone);
	play_course_teebox_index = if_undef(root_map[? "playing_teebox_index"],noone);
	play_course_yardage = if_undef(root_map[? "playing_yardage"],noone);
	play_course_slope = if_undef(root_map[? "playing_slope"],noone);
	play_course_rating = if_undef(root_map[? "playing_rating"],noone);
	play_course_par = if_undef(root_map[? "playing_par"],noone);
	play_course_handicap_inc = if_undef(root_map[? "playing_handicap_inc"],noone);
	play_course_handicap_dec = if_undef(root_map[? "playing_handicap_dec"],noone);

	play_course_score = ""; // if_undef(root_map[? "playing_score"],"");
	play_course_esc = ""; // if_undef(root_map[? "playing_esc"],"");

	if play_course_id != noone && play_course_id[| course_data.name] != play_course_name
		{
		play_course_id = noone;
		play_course_index = noone;
		play_course_name = "";
		play_course_teebox = noone;
		play_course_teebox_index = noone;
		play_course_yardage = noone;
		play_course_slope = noone;
		play_course_rating = noone;
		play_course_par = noone;
		play_course_handicap_inc = noone;
		play_course_handicap_dec = noone;
		}

	/*
	show_message(play_course_index)
	show_message(play_course_id[| course_data.name])
	show_message(play_course_name)
	show_message(play_course_teebox)
	show_message(play_course_teebox_index)
	show_message(play_course_yardage)
	show_message(play_course_slope)
	show_message(play_course_rating)
	show_message(play_course_handicap_inc)
	show_message(play_course_handicap_dec)

	*/

	show_debug_message("Settings loaded!");



}
