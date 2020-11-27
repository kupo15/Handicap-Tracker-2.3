function ini_create() {

layout_normal();
ini_teebox();
//

recent_scores_list = ds_list_create();
included_scores = ds_list_create();

top_scores = 8;
ghin_index = 0;
round_selection = 20;

handicap_trend_type = 0;

stat_tee_index = noone;
stat_index = 0;
tee_index = undefined;
subcourse_index = 0;

course_struct = undefined;
score_struct = undefined;

course_index = undefined;
score_index = undefined;

scr_handicap_calculate();
}
