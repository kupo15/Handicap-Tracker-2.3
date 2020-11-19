function scr_trend_set() {
	
var list_size = 0;
var size = ds_list_size(master_score_list);
for(var i=0;i<size;i++)
	{
	var pointer = master_score_list[| i];
	var ind = pointer[| score_data.index];
		
	if real(ind) != noone
	list_size ++;
	}
		
index_trend_offset = list_size-8;
}
