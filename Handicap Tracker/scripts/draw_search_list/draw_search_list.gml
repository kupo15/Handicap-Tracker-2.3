/*
function draw_search_list(argument0, argument1, argument2, argument3, argument4, argument5) {
/// @param xx
/// @param yy
/// @param sep
/// @param rows
/// @param text_height

	var xx = argument0;
	var yy = argument1;
	var ww = argument2;
	var sep = argument3;
	var rows = argument4;
	var height = argument5;

	var size = ds_grid_height(search_grid);
	for(var i=0;i<size;i++)
		{
		var pointer = search_grid[# 1,i];
		var ind = search_grid[# 2,i];
		var course_name = pointer[| course_data.name];
	
		draw_text_height(xx+30,yy+10+(i*sep),course_name,height); // draw course name
	
	    if click_region_released(xx,yy+(i*sep),ww,sep,true,0) 
		scr_coursebar_select(ind,course_name);
		}
	
	if searched && size == 0 // if no results
	draw_text_height(xx+30,yy+10,"no results!",height); // draw no results



}
