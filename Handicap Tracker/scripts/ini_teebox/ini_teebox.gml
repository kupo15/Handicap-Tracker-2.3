function ini_teebox() {
	teebox_list = ds_list_create();

	ds_list_add(teebox_list,"Green");
	ds_list_add(teebox_list,"Red");
	ds_list_add(teebox_list,"White");
	ds_list_add(teebox_list,"Blue");
	ds_list_add(teebox_list,"Gold");
	ds_list_add(teebox_list,"Black");

	teebox_filled = ds_list_create();
	
	var size = ds_list_size(teebox_list);
	for(var i=0;i<size;i++)
		{
		stat_tee[i] = ds_list_create();
		temp_tee_data[i] = ds_list_create();
		
		repeat 4
		ds_list_add(temp_tee_data[i],"");
		
		ds_list_add(teebox_filled,false);
		}
}
