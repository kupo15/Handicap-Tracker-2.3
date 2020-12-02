function ini_teebox() {
	
teebox_list = ds_list_create();

// add default colors
teebox_list[| tee_marker.green] = "Green";
teebox_list[| tee_marker.red] = "Red";
teebox_list[| tee_marker.white] = "White";
teebox_list[| tee_marker.blue] = "Blue";
teebox_list[| tee_marker.gold] = "Gold";
teebox_list[| tee_marker.black] = "Black";

teebox_filled = ds_list_create();
	
var size = ds_list_size(teebox_list);
for(var i=0;i<size;i++)
ds_list_add(teebox_filled,false);
	
}
