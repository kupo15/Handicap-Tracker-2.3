function scr_trend_set() {
	
var size = ds_list_size(included_scores);
var list_size = clamp(size-round_selection,0,size);

index_trend_offset = 0; // max(list_size-8,0);

ds_list_sort_nested_struct(included_scores,"roundDate",true); // included score sort oldest first
}
