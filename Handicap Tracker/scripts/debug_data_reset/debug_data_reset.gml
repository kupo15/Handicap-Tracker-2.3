function debug_data_reset() {
db("***debug reset***");

root_data_create();
scr_profile_create("Matt");
scr_profile_create("Megan");


var list_num = array_length(COURSE_database);
for(var n=0;n<list_num;n++)
	{
	var course_pointer = COURSE_database[n];
	var course_id = course_pointer.courseID;
			
	// loop through profiles
	var size = array_length(ROOT_data_struct.profiles);
	for(var i=0;i<size;i++)
		{
		var arr = ROOT_data_struct.profiles[i].courselist;
		scr_course_add_local(course_id,arr);
		}
	}
	
debug_data_scores();

// reset
score_struct = undefined;
course_struct = undefined;

// set back to starting profile
scr_profile_set(0);
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