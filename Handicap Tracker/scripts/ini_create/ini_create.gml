function ini_create() {

layout_normal();
ini_teebox();
//


recent_scores_list = ds_list_create();
included_scores = ds_list_create();

top_scores = 8;
ghin_index = 0;
round_selection = 20;
rounds_played = array_length(scorelist_array);
old_course_name = "";

handicap_trend_type = 0;

stat_tee_index = noone;
stat_index = 0;
tee_index = undefined;
subcourse_index = 0;

course_struct = undefined;
score_struct = undefined;

course_index = undefined;
score_index = undefined;

#region scrollbar

score_list_offset = 0;
score_list_offset_start = score_list_offset;

handicap_season_offset = 0;
handicap_season_offset_start = handicap_season_offset;

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
