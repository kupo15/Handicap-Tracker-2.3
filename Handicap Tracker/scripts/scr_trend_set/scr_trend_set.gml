function scr_trend_set() {
	
var size = array_length(included_scores_array);
var list_size = clamp(size-round_selection,0,size);

offsetArray[offsetScroll.indexOffset] = max(size-8,0);

scr_score_sort(included_scores_array,true);
//ds_list_sort_nested_struct(included_scores,"roundDate",true); // included score sort oldest first
}
