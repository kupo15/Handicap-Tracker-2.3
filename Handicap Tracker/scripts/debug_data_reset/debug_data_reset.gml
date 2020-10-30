function debug_data_reset() {
	if !debug_reset
	exit;

	rounds_played = 0;
	ds_list_clear(master_course_list);
	ds_list_clear(master_score_list);
	scr_playing_clear();

	// debug
	scr_course_add_index("Atlantic Country Club",tee_marker.gold,"6728","137","73.1","72");
	scr_course_add_index("Apple Mountain Golf",tee_marker.blue,"6668","124","71.9","70");
	scr_course_add_index("Bass Rocks",tee_marker.gold,"5953","124","69.3","69");
	scr_course_add_index("Braintree Municipal",tee_marker.white,"6212","123","70.0","72");
	scr_course_add_index("Broad Run Golf Club",tee_marker.white,"6080","132","70.3","72");
	scr_course_add_index("Campbell's Scottish Highlands",tee_marker.blue,"6249","121","70.1","71");
	scr_course_add_index("Cape May National",tee_marker.white,"6063","125","69.0","71");
	scr_course_add_index("Cape May National",tee_marker.blue,"6592","130","71.4","71");
	scr_course_add_index("Charleston Springs",tee_marker.gold,"6374","121","70.3","72");
	scr_course_add_index("Crosswinds-Jones/Zaharias",tee_marker.gold,"6520","134","71.9","72");
	scr_course_add_index("Crotched Mountain",tee_marker.blue,"6277","125","69.2","71");
	scr_course_add_index("Crumpin Fox Club",tee_marker.blue,"6508","141","72.2","72");
	scr_course_add_index("Crystal Lake Golf Club",tee_marker.blue,"6501","129","71.9","72");
	scr_course_add_index("Gardner Municipal",tee_marker.blue,"6131","128","69.8","71");
	scr_course_add_index("Granite Fields Golf Club",tee_marker.blue,"6543","130","71.7","72");
	scr_course_add_index("Hickory Hills",tee_marker.white,"6020","119","69.6","71");
	scr_course_add_index("Hickory Hills",tee_marker.blue,"6287","123","70.8","71");
	scr_course_add_index("Highfields",tee_marker.gold,"6474","134","71.7","72");
	scr_course_add_index("Ledges Golf Club",tee_marker.black,"6981","137","74.2","72");
	scr_course_add_index("McCullough's Emerald Links",tee_marker.blue,"6132","125","69.8","71");
	scr_course_add_index("Nashua Country Club",tee_marker.blue,"5965","126","69.8","71");
	scr_course_add_index("Newton Commonwealth",tee_marker.blue,"5354","119","67.0","70");
	scr_course_add_index("Olde Scottish Links",tee_marker.black,"6790","126","72.6","72");
	scr_course_add_index("Olde Scottish Links",tee_marker.blue,"6306","124","70.3","72");
	scr_course_add_index("Pembroke Country Club",tee_marker.blue,"6677","132","73.3","71");
	scr_course_add_index("Pinehills - Nicklaus",tee_marker.blue,"6640","131","72.2","72");
	scr_course_add_index("Putterham Meadows",tee_marker.white,"5859","116","68.1","70");
	scr_course_add_index("Putterham Meadows",tee_marker.blue,"6208","124","70.0","70");
	scr_course_add_index("West Bridgewater Country Club",tee_marker.gold,"6659","127","70.9","71");
	scr_course_add_index("Riverwinds",tee_marker.white,"6576","128","70.3","72");
	scr_course_add_index("Riverwinds",tee_marker.blue,"6843","132","72.3","72");
	scr_course_add_index("Riverwinds",tee_marker.black,"7086","135","73.8","72");
	scr_course_add_index("Rolling Green",tee_marker.blue,"6695","140","73.7","71");
	scr_course_add_index("Sagamore Spring",tee_marker.black,"5972","125","69.1","70");
	scr_course_add_index("Shore Gate",tee_marker.white,"6391","137","71.0","72");
	scr_course_add_index("Souhegan Woods",tee_marker.blue,"6507","125","70.3","72");
	scr_course_add_index("South Shore Country Club",tee_marker.blue,"6470","132","70.6","72");
	scr_course_add_index("Stow Acres C. C.-North Course",tee_marker.blue,"7001","130","73.7","72");
	scr_course_add_index("Stow Acres C. C.-South Course",tee_marker.blue,"6520","128","71.7","72");
	scr_course_add_index("Vineyard Golf",tee_marker.white,"6358","125","70.4","72");
	scr_course_add_index("Vineyard Golf",tee_marker.blue,"6746","129","72.0","72");
	scr_course_add_index("Waverly Oaks",tee_marker.gold,"6682","124","72.3","72");
	scr_course_add_index("Windham Country Club",tee_marker.blue,"6033","130","69.1","72");

	ds_list_sort_nested(master_course_list,course_data.name,true);

	// add scores
	var date = date_create_datetime(2018,5,16,1,1,1); scr_score_add_index("Putterham Meadows",teebox_list[| tee_marker.white],"86",date);
	var date = date_create_datetime(2018,5,19,1,1,1); scr_score_add_index("Apple Mountain Golf",teebox_list[| tee_marker.blue],"84",date);
	var date = date_create_datetime(2018,5,28,1,1,1); scr_score_add_index("Riverwinds",teebox_list[| tee_marker.white],"89",date);
	var date = date_create_datetime(2018,6,2,1,1,1); scr_score_add_index("South Shore Country Club",teebox_list[| tee_marker.blue],"97",date);
	var date = date_create_datetime(2018,6,18,1,1,1); scr_score_add_index("Riverwinds",teebox_list[| tee_marker.white],"88",date);
	var date = date_create_datetime(2018,7,29,1,1,1); scr_score_add_index("Pembroke Country Club",teebox_list[| tee_marker.blue],"96",date);
	var date = date_create_datetime(2018,8,5,1,1,1); scr_score_add_index("Putterham Meadows",teebox_list[| tee_marker.blue],"89",date);
	var date = date_create_datetime(2018,8,12,1,1,1); scr_score_add_index("Cape May National",teebox_list[| tee_marker.white],"90",date);
	var date = date_create_datetime(2018,9,16,1,1,1); scr_score_add_index("Nashua Country Club",teebox_list[| tee_marker.blue],"80",date);
	var date = date_create_datetime(2018,11,11,1,1,1); scr_score_add_index("Stow Acres C. C.-South Course",teebox_list[| tee_marker.blue],"90",date);
	var date = date_create_datetime(2019,4,13,1,1,1); scr_score_add_index("Crystal Lake Golf Club",teebox_list[| tee_marker.blue],"86",date);
	var date = date_create_datetime(2019,5,4,1,1,1); scr_score_add_index("Granite Fields Golf Club",teebox_list[| tee_marker.blue],"89",date);
	var date = date_create_datetime(2019,5,11,1,1,1); scr_score_add_index("Stow Acres C. C.-North Course",teebox_list[| tee_marker.blue],"91",date);
	var date = date_create_datetime(2019,5,22,1,1,1); scr_score_add_index("Bass Rocks",teebox_list[| tee_marker.gold],"84",date);
	var date = date_create_datetime(2019,5,26,1,1,1); scr_score_add_index("Cape May National",teebox_list[| tee_marker.white],"87",date);
	var date = date_create_datetime(2019,6,15,1,1,1); scr_score_add_index("Hickory Hills",teebox_list[| tee_marker.blue],"84",date);
	var date = date_create_datetime(2019,6,17,1,1,1); scr_score_add_index("Hickory Hills",teebox_list[| tee_marker.blue],"80",date);
	var date = date_create_datetime(2019,6,23,1,1,1); scr_score_add_index("Campbell's Scottish Highlands",teebox_list[| tee_marker.blue],"81",date);
	var date = date_create_datetime(2019,6,29,1,1,1); scr_score_add_index("Souhegan Woods",teebox_list[| tee_marker.blue],"79",date);
	var date = date_create_datetime(2019,7,13,1,1,1); scr_score_add_index("Ledges Golf Club",teebox_list[| tee_marker.black],"86",date);
	var date = date_create_datetime(2019,7,24,1,1,1); scr_score_add_index("Bass Rocks",teebox_list[| tee_marker.gold],"80",date);
	var date = date_create_datetime(2019,7,27,1,1,1); scr_score_add_index("Pembroke Country Club",teebox_list[| tee_marker.blue],"89",date);
	var date = date_create_datetime(2019,7,28,1,1,1); scr_score_add_index("Braintree Municipal",teebox_list[| tee_marker.white],"88",date);
	var date = date_create_datetime(2019,8,3,1,1,1); scr_score_add_index("Ledges Golf Club",teebox_list[| tee_marker.black],"81",date);
	var date = date_create_datetime(2019,8,10,1,1,1); scr_score_add_index("Riverwinds",teebox_list[| tee_marker.white],"81",date);
	var date = date_create_datetime(2019,8,17,1,1,1); scr_score_add_index("Windham Country Club",teebox_list[| tee_marker.blue],"90",date);
	var date = date_create_datetime(2019,9,11,1,1,1); scr_score_add_index("Charleston Springs",teebox_list[| tee_marker.gold],"82",date);
	var date = date_create_datetime(2019,10,28,1,1,1); scr_score_add_index("Broad Run Golf Club",teebox_list[| tee_marker.white],"84",date);
	var date = date_create_datetime(2020,5,16,1,1,1); scr_score_add_index("Waverly Oaks",teebox_list[| tee_marker.gold],"84",date,1);
	var date = date_create_datetime(2020,5,23,1,1,1); scr_score_add_index("Highfields",teebox_list[| tee_marker.gold],"83",date);
	var date = date_create_datetime(2020,6,18,1,1,1); scr_score_add_index("Riverwinds",teebox_list[| tee_marker.blue],"83",date);
	var date = date_create_datetime(2020,6,21,1,1,1); scr_score_add_index("Gardner Municipal",teebox_list[| tee_marker.blue],"83",date);
	var date = date_create_datetime(2020,6,27,1,1,1); scr_score_add_index("Crosswinds-Jones/Zaharias",teebox_list[| tee_marker.gold],"88",date,2);
	var date = date_create_datetime(2020,7,2,1,1,1); scr_score_add_index("Rolling Green",teebox_list[| tee_marker.blue],"89",date);
	var date = date_create_datetime(2020,7,5,1,1,1); scr_score_add_index("Shore Gate",teebox_list[| tee_marker.white],"84",date);
	var date = date_create_datetime(2020,7,18,1,1,1); scr_score_add_index("West Bridgewater Country Club",teebox_list[| tee_marker.gold],"78",date);
	var date = date_create_datetime(2020,7,19,1,1,1); scr_score_add_index("Olde Scottish Links",teebox_list[| tee_marker.black],"87",date,1);
	var date = date_create_datetime(2020,7,26,1,1,1); scr_score_add_index("Crosswinds-Jones/Zaharias",teebox_list[| tee_marker.gold],"87",date);
	var date = date_create_datetime(2020,8,2,1,1,1); scr_score_add_index("Olde Scottish Links",teebox_list[| tee_marker.blue],"83",date,1);
	var date = date_create_datetime(2020,8,8,1,1,1); scr_score_add_index("Atlantic Country Club",teebox_list[| tee_marker.gold],"80",date);
	var date = date_create_datetime(2020,8,14,1,1,1); scr_score_add_index("Vineyard Golf",teebox_list[| tee_marker.white],"83",date);
	var date = date_create_datetime(2020,8,22,1,1,1); scr_score_add_index("Campbell's Scottish Highlands",teebox_list[| tee_marker.blue],"77",date);
	var date = date_create_datetime(2020,8,30,1,1,1); scr_score_add_index("West Bridgewater Country Club",teebox_list[| tee_marker.gold],"89",date);
	var date = date_create_datetime(2020,9,4,1,1,1); scr_score_add_index("McCullough's Emerald Links",teebox_list[| tee_marker.blue],"80",date);
	var date = date_create_datetime(2020,9,26,1,1,1); scr_score_add_index("West Bridgewater Country Club",teebox_list[| tee_marker.gold],"91",date,2);
	var date = date_create_datetime(2020,9,30,1,1,1); scr_score_add_index("Bass Rocks",teebox_list[| tee_marker.gold],"79",date,1);
	var date = date_create_datetime(2020,10,3,1,1,1); scr_score_add_index("Crotched Mountain",teebox_list[| tee_marker.blue],"87",date,2);

	repeat 20
	{
	// var date = date_create_datetime(2020,8,irandom(20),1,1,1); 
	// scr_score_add_index("Atlantic Country Club",teebox_list[| tee_marker.gold],string(irandom_range(66,90)),date);
	}

	ds_list_sort_nested(master_score_list,score_data.date,false); // date sort

	rounds_played = ds_list_size(master_score_list);

	scr_handicap_calculate();
	json_save(save_data);


}
