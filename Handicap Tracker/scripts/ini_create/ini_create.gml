function ini_create() {

layout_normal();
ini_teebox();
scr_playing_clear();

temp_course_tee = "";
temp_course_yardage = "";
temp_course_slope = "";
temp_course_rating = "";
temp_course_par = "";

temp_score_tee = "";
temp_score_yardage = "";
temp_score_slope = "";
temp_score_rating = "";
temp_score_par = "";

//


recent_scores_list = ds_list_create();

top_scores = 8;
ghin_index = 0;
round_selection = 20;
rounds_played = array_length(scorelist_array);
old_course_name = "";

handicap_trend_type = 0;

stat_tee_index = noone;
stat_index = 0;
prev_screen = noone;
course_edit_name = undefined;
course_id = noone;
teebox_index = 00;
index = 0;

active_course = undefined;
active_tee = undefined;
active_score = undefined;
tee_index = undefined;

course_edit_yardage = "";
course_edit_slope = "";
course_edit_rating = "";
course_edit_par = "";

temp_score = undefined;
temp_strokes = undefined;

#region offsets
navbar_yoff = 0;
navbar_yoff_start = 0;

teebar_yoff = 0;
teebar_yoff_start = 0;
	
scorebar_yoff = 0;
scorebar_yoff_start = 0;
	
parbar_yoff = 0;
parbar_yoff_start = 0;

coursebar_yoff = 0;
coursebar_yoff_start = 0;

numpad_yoff = 0;
numpad_yoff_start = 0;
	
#endregion

#region scrollbar

score_list_offset = 0;
score_list_offset_start = score_list_offset;

course_list_offset = 0;
course_list_offset_start = 0;

stat_offset = 0;
stat_offset_start = 0;

index_trend_offset = 0;
index_trend_offset_start = 0;
#endregion

debug_data_reset();
scr_handicap_calculate();
}
