function scr_trend_set() {
	
var list_size = 0;
var size = array_length(scorelist_array);
for(var i=0;i<size;i++)
	{
	var pointer = scorelist_array[i];
	var ind = pointer.indexHistory;
		
	if ind != undefined
	list_size ++;
	}

index_trend_offset = 0;// list_size-8;
}
