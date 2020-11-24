/*
function scr_coursebar_select(ind,course_name) {

	textboxIndex = noone;
	keyboard_string = "";
	vk_hide();

	if screenIndex == screen.playing
		{
		play_course_index = ind;
		play_course_struct = master_course_list[| play_course_index]; // set course id;
		play_course_name = play_course_struct[| course_data.name];
		play_course_teebox = noone;
		play_course_yardage = noone;
		play_course_slope = noone;
		play_course_rating = noone;
		play_course_par = noone;
		}
	else if screenIndex != screen.stats
		{
		var score_pointer = master_score_list[| index];
		score_pointer[| score_data.course] = course_name; // set course name
		}
	else
		{
		stat_index = ind;
		stat_tee_index = noone;
		}
			
	course_id = master_course_list[| ind]; // set course id
	scr_tee_filled_set(); // set teebox fill
		
	// set navbar
	if screenIndex == screen.playing
	submenu = navbar.teebar;
	else if screenIndex == screen.score_create
	submenu = navbar.teebar; // move to tee selection
	else if screenIndex == screen.stats
		{
		scr_stats_set();
		submenu = navbar.main;
		}	
	else
	submenu = navbar.hidden;


}
