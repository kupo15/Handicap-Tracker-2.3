function ini_teebox() {
	
teebox_list = ds_list_create();

// add default colors
teebox_list[| tee_marker.green] = "Green";
teebox_list[| tee_marker.red] = "Red";
teebox_list[| tee_marker.white] = "White";
teebox_list[| tee_marker.blue] = "Blue";
teebox_list[| tee_marker.gold] = "Gold";
teebox_list[| tee_marker.black] = "Black";	
}
