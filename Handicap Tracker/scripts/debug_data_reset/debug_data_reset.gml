function debug_data_reset() {
db("***debug reset***");

root_data_create();
scr_profile_create("Matt");
scr_profile_create("Megan");

rounds_played = 0;
subcourse_index = 0;

debug_data_courses();
debug_data_scores();

score_struct = undefined;
course_struct = undefined;

scr_profile_set(0);
}

function debug_data_courses() {
	
// debug
var arr = courselist_array;
scr_course_create("Atlantic Country Club","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"gold","6728","137","73.1","72");

scr_course_create("Apple Mountain Golf","NJ",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6668","124","71.9","70");

scr_course_create("Bass Rocks","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"gold","5953","124","69.3","69");

scr_course_create("Braintree Municipal","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"white","6212","123","70.0","72");

scr_course_create("Broad Run Golf Club","NJ",undefined,undefined,arr);
scr_course_add_tee(course_struct,"white","6080","132","70.3","72");

scr_course_create("Campbell's Scottish Highlands","MA",undefined,true,arr);
scr_course_add_tee(course_struct,"blue","6249","121","70.1","71");

scr_course_create("Cape May National","NJ",undefined,undefined,arr);
scr_course_add_tee(course_struct,"white","6063","125","69.0","71");
scr_course_add_tee(course_struct,"blue","6592","130","71.4","71");

scr_course_create("Charleston Springs","NJ",undefined,true,arr);
scr_course_add_tee(course_struct,"gold","6374","121","70.3","72");

scr_course_create("Crosswinds-Jones/Zaharias","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"gold","6520","134","71.9","72");

scr_course_create("Crotched Mountain","NH",undefined,undefined,arr);
scr_course_add_tee(course_struct,"red","4604","117","67.4","71");
scr_course_add_tee(course_struct,"blue","6277","125","69.2","71");

scr_course_create("Crumpin Fox Club","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6508","141","72.2","72");

scr_course_create("Crystal Lake Golf Club","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6501","129","71.9","72");

scr_course_create("Gardner Municipal","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6131","128","69.8","71");

scr_course_create("Granite Fields Golf Club","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6543","130","71.7","72");

scr_course_create("Hickory Hills","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"white","6020","119","69.6","71");
scr_course_add_tee(course_struct,"blue","6287","123","70.8","71");

scr_course_create("Highfields","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"gold","6474","134","71.7","72");

scr_course_create("Ledges Golf Club","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"black","6981","137","74.2","72");

scr_course_create("McCullough's Emerald Links","NJ",undefined,true,arr);
scr_course_add_tee(course_struct,"white","6132","125","69.8","71");
scr_course_add_tee(course_struct,"blue","6535","135","72.2","71");

scr_course_create("Nashua Country Club","NH",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","5965","126","69.8","71");

scr_course_create("Newton Commonwealth","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","5354","119","67.0","70");

scr_course_create("Olde Scottish Links","MA",undefined,true,arr);
scr_course_add_tee(course_struct,"green","5396","110","65.9","72");
scr_course_add_tee(course_struct,"blue","6306","124","70.3","72");
scr_course_add_tee(course_struct,"black","6790","126","72.6","72");

scr_course_create("Pembroke Country Club","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6677","132","73.3","71");

scr_course_create("Pinehills - Nicklaus","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6640","131","72.2","72");

scr_course_create("Putterham Meadows","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"white","5859","116","68.1","70");
scr_course_add_tee(course_struct,"blue","6208","124","70.0","70");

scr_course_create("West Bridgewater Country Club","MA",undefined,true,arr);
scr_course_add_tee(course_struct,"red","4915","120","67.7","71");
scr_course_add_tee(course_struct,"gold","6659","127","70.9","71");

scr_course_create("Riverwinds","NJ",undefined,true,arr);
scr_course_add_tee(course_struct,"white","6576","128","70.3","72");
scr_course_add_tee(course_struct,"blue","6843","132","72.3","72");
scr_course_add_tee(course_struct,"black","7086","135","73.8","72");
scr_course_add_tee(course_struct,"green","6544","126","70.8","72");

scr_course_create("Rolling Green","PA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6695","140","73.7","71");

scr_course_create("Sagamore Spring","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"black","5972","125","69.1","70");

scr_course_create("Shore Gate","NJ",undefined,undefined,arr);
scr_course_add_tee(course_struct,"white","6391","137","71.0","72");

scr_course_create("Souhegan Woods","NH",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6507","125","70.3","72");

scr_course_create("South Shore Country Club","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6470","132","70.6","72");

scr_course_create("Stow Acres C. C.-North Course","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","7001","130","73.7","72");

scr_course_create("Stow Acres C. C.-South Course","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6520","128","71.7","72");

scr_course_create("Vineyard Golf","NJ",undefined,true,arr);
scr_course_add_tee(course_struct,"white","6358","125","70.4","72");
scr_course_add_tee(course_struct,"blue","6746","129","72.0","72");

scr_course_create("Waverly Oaks","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"gold","6682","124","72.3","72");

scr_course_create("Windham Country Club","MA",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","6033","130","69.1","72");

scr_course_create("Crystal Lake Golf Club - RI","RI",undefined,undefined,arr);
scr_course_add_tee(course_struct,"blue","5966","119","69.1","71");

array_sort_nested_struct(arr,"courseName",true);
}

function debug_data_scores() {
	
// matt profile
scr_profile_set(0);
	
// add scores
var date = date_create_datetime(2018,5,16,1,1,1); scr_score_add_index("Putterham Meadows","white","86",date);
var date = date_create_datetime(2018,5,19,1,1,1); scr_score_add_index("Apple Mountain Golf","blue","84",date);
var date = date_create_datetime(2018,5,28,1,1,1); scr_score_add_index("Riverwinds","white","89",date);
var date = date_create_datetime(2018,6,2,1,1,1); scr_score_add_index("South Shore Country Club","blue","97",date);
var date = date_create_datetime(2018,6,18,1,1,1); scr_score_add_index("Riverwinds","white","88",date);
var date = date_create_datetime(2018,7,29,1,1,1); scr_score_add_index("Pembroke Country Club","blue","96",date);
var date = date_create_datetime(2018,8,5,1,1,1); scr_score_add_index("Putterham Meadows","blue","89",date);
var date = date_create_datetime(2018,8,12,1,1,1); scr_score_add_index("Cape May National","white","90",date);
var date = date_create_datetime(2018,9,16,1,1,1); scr_score_add_index("Nashua Country Club","blue","80",date);
var date = date_create_datetime(2018,11,11,1,1,1); scr_score_add_index("Stow Acres C. C.-South Course","blue","90",date);
var date = date_create_datetime(2019,4,13,1,1,1); scr_score_add_index("Crystal Lake Golf Club","blue","86",date);
var date = date_create_datetime(2019,5,4,1,1,1); scr_score_add_index("Granite Fields Golf Club","blue","89",date);
var date = date_create_datetime(2019,5,11,1,1,1); scr_score_add_index("Stow Acres C. C.-North Course","blue","91",date);
var date = date_create_datetime(2019,5,22,1,1,1); scr_score_add_index("Bass Rocks","gold","84",date);
var date = date_create_datetime(2019,5,26,1,1,1); scr_score_add_index("Cape May National","white","87",date);
var date = date_create_datetime(2019,6,15,1,1,1); scr_score_add_index("Hickory Hills","blue","84",date);
var date = date_create_datetime(2019,6,17,1,1,1); scr_score_add_index("Hickory Hills","blue","80",date);
var date = date_create_datetime(2019,6,23,1,1,1); scr_score_add_index("Campbell's Scottish Highlands","blue","81",date);
var date = date_create_datetime(2019,6,29,1,1,1); scr_score_add_index("Souhegan Woods","blue","79",date);
var date = date_create_datetime(2019,7,13,1,1,1); scr_score_add_index("Ledges Golf Club","black","86",date);
var date = date_create_datetime(2019,7,24,1,1,1); scr_score_add_index("Bass Rocks","gold","80",date);
var date = date_create_datetime(2019,7,27,1,1,1); scr_score_add_index("Pembroke Country Club","blue","89",date);
var date = date_create_datetime(2019,7,28,1,1,1); scr_score_add_index("Braintree Municipal","white","88",date);
var date = date_create_datetime(2019,8,3,1,1,1); scr_score_add_index("Ledges Golf Club","black","81",date);
var date = date_create_datetime(2019,8,10,1,1,1); scr_score_add_index("Riverwinds","white","81",date);
var date = date_create_datetime(2019,8,17,1,1,1); scr_score_add_index("Windham Country Club","blue","90",date);
var date = date_create_datetime(2019,9,11,1,1,1); scr_score_add_index("Charleston Springs","gold","82",date);
var date = date_create_datetime(2019,10,28,1,1,1); scr_score_add_index("Broad Run Golf Club","white","84",date);
var date = date_create_datetime(2020,5,16,1,1,1); scr_score_add_index("Waverly Oaks","gold","84",date,1);
var date = date_create_datetime(2020,5,23,1,1,1); scr_score_add_index("Highfields","gold","83",date);
var date = date_create_datetime(2020,6,18,1,1,1); scr_score_add_index("Riverwinds","blue","83",date);
var date = date_create_datetime(2020,6,21,1,1,1); scr_score_add_index("Gardner Municipal","blue","83",date);
var date = date_create_datetime(2020,6,27,1,1,1); scr_score_add_index("Crosswinds-Jones/Zaharias","gold","88",date,2);
var date = date_create_datetime(2020,7,2,1,1,1); scr_score_add_index("Rolling Green","blue","89",date);
var date = date_create_datetime(2020,7,5,1,1,1); scr_score_add_index("Shore Gate","white","84",date);
var date = date_create_datetime(2020,7,18,1,1,1); scr_score_add_index("West Bridgewater Country Club","gold","78",date);
var date = date_create_datetime(2020,7,19,1,1,1); scr_score_add_index("Olde Scottish Links","black","87",date,1);
var date = date_create_datetime(2020,7,26,1,1,1); scr_score_add_index("Crosswinds-Jones/Zaharias","gold","87",date);
var date = date_create_datetime(2020,8,2,1,1,1); scr_score_add_index("Olde Scottish Links","blue","83",date,1);
var date = date_create_datetime(2020,8,8,1,1,1); scr_score_add_index("Atlantic Country Club","gold","80",date);
var date = date_create_datetime(2020,8,14,1,1,1); scr_score_add_index("Vineyard Golf","white","83",date);
var date = date_create_datetime(2020,8,22,1,1,1); scr_score_add_index("Campbell's Scottish Highlands","blue","77",date);
var date = date_create_datetime(2020,8,30,1,1,1); scr_score_add_index("West Bridgewater Country Club","gold","89",date);
var date = date_create_datetime(2020,9,4,1,1,1); scr_score_add_index("McCullough's Emerald Links","white","80",date);
var date = date_create_datetime(2020,9,26,1,1,1); scr_score_add_index("West Bridgewater Country Club","gold","91",date,2);
var date = date_create_datetime(2020,9,30,1,1,1); scr_score_add_index("Bass Rocks","gold","79",date,1);
var date = date_create_datetime(2020,10,3,1,1,1); scr_score_add_index("Crotched Mountain","blue","87",date,2);
var date = date_create_datetime(2020,10,11,1,1,1); scr_score_add_index("Olde Scottish Links","blue","85",date,2);
var date = date_create_datetime(2020,11,8,1,1,1); scr_score_add_index("Stow Acres C. C.-North Course","blue","85",date,2);
var date = date_create_datetime(2020,11,21,1,1,1); scr_score_add_index("Crystal Lake Golf Club - RI","blue","83",date);
var date = date_create_datetime(2020,11,25,1,1,1); scr_score_add_index("Riverwinds","green","85",date);
var date = date_create_datetime(2020,11,28,1,1,1); scr_score_add_index("McCullough's Emerald Links","blue","83",date);

scoresort;

// set to megan's profile
scr_profile_set(1);

var date = date_create_datetime(2020,9,20,1,1,1); scr_score_add_index("Olde Scottish Links","green","134",date,4);
var date = date_create_datetime(2020,9,26,1,1,1); scr_score_add_index("West Bridgewater Country Club","red","119",date);
var date = date_create_datetime(2020,10,3,1,1,1); scr_score_add_index("Crotched Mountain","red","150",date,5);

scoresort;

}