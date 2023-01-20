function debug_data_reset() {
db("***debug reset***");

root_data_create();
scr_profile_create("Matt");
scr_profile_create("Megan");

// TEMPORARY
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
var date = date_create_datetime(2018,5,16,1,1,1); scr_score_add_index("Putterham Meadows","MA","white","86",date);
var date = date_create_datetime(2018,5,19,1,1,1); scr_score_add_index("Apple Mountain Golf","NJ","blue","84",date);
var date = date_create_datetime(2018,5,28,1,1,1); scr_score_add_index("Riverwinds","NJ","white","89",date);
var date = date_create_datetime(2018,6,2,1,1,1); scr_score_add_index("South Shore Country Club","MA","blue","97",date);
var date = date_create_datetime(2018,6,18,1,1,1); scr_score_add_index("Riverwinds","NJ","white","88",date);
var date = date_create_datetime(2018,7,29,1,1,1); scr_score_add_index("Pembroke Country Club","MA","blue","96",date);
var date = date_create_datetime(2018,8,5,1,1,1); scr_score_add_index("Putterham Meadows","MA","blue","89",date);
var date = date_create_datetime(2018,8,12,1,1,1); scr_score_add_index("Cape May National","NJ","white","90",date);
var date = date_create_datetime(2018,9,16,1,1,1); scr_score_add_index("Nashua Country Club","NH","blue","80",date);
var date = date_create_datetime(2018,11,11,1,1,1); scr_score_add_index("Stow Acres C. C.-South Course","MA","blue","90",date);
var date = date_create_datetime(2019,4,13,1,1,1); scr_score_add_index("Crystal Lake Golf Club","MA","blue","86",date);
var date = date_create_datetime(2019,5,4,1,1,1); scr_score_add_index("Granite Fields Golf Club","NH","blue","89",date);
var date = date_create_datetime(2019,5,11,1,1,1); scr_score_add_index("Stow Acres C. C.-North Course","MA","blue","91",date);
var date = date_create_datetime(2019,5,22,1,1,1); scr_score_add_index("Bass Rocks","MA","gold","84",date);
var date = date_create_datetime(2019,5,26,1,1,1); scr_score_add_index("Cape May National","NJ","white","87",date);
var date = date_create_datetime(2019,6,15,1,1,1); scr_score_add_index("Hickory Hills","MA","blue","84",date);
var date = date_create_datetime(2019,6,17,1,1,1); scr_score_add_index("Hickory Hills","MA","blue","80",date);
var date = date_create_datetime(2019,6,23,1,1,1); scr_score_add_index("Campbell's Scottish Highlands","NH","blue","81",date);
var date = date_create_datetime(2019,6,29,1,1,1); scr_score_add_index("Souhegan Woods","NH","blue","79",date);
var date = date_create_datetime(2019,7,13,1,1,1); scr_score_add_index("Ledges Golf Club","ME","black","86",date);
var date = date_create_datetime(2019,7,24,1,1,1); scr_score_add_index("Bass Rocks","MA","gold","80",date);
var date = date_create_datetime(2019,7,27,1,1,1); scr_score_add_index("Pembroke Country Club","MA","blue","89",date);
var date = date_create_datetime(2019,7,28,1,1,1); scr_score_add_index("Braintree Municipal","MA","white","88",date);
var date = date_create_datetime(2019,8,3,1,1,1); scr_score_add_index("Ledges Golf Club","ME","black","81",date);
var date = date_create_datetime(2019,8,10,1,1,1); scr_score_add_index("Riverwinds","NJ","white","81",date);
var date = date_create_datetime(2019,8,17,1,1,1); scr_score_add_index("Windham Country Club","NH","blue","90",date);
var date = date_create_datetime(2019,9,11,1,1,1); scr_score_add_index("Charleston Springs","NJ","gold","82",date);
var date = date_create_datetime(2019,10,28,1,1,1); scr_score_add_index("Broad Run Golf Club","PA","white","84",date);
var date = date_create_datetime(2020,5,16,1,1,1); scr_score_add_index("Waverly Oaks","MA","gold","84",date,1);
var date = date_create_datetime(2020,5,23,1,1,1); scr_score_add_index("Highfields","MA","gold","83",date);
var date = date_create_datetime(2020,6,18,1,1,1); scr_score_add_index("Riverwinds","NJ","blue","83",date);
var date = date_create_datetime(2020,6,21,1,1,1); scr_score_add_index("Gardner Municipal","MA","blue","83",date);
var date = date_create_datetime(2020,6,27,1,1,1); scr_score_add_index("Crosswinds-Jones/Zaharias","MA","gold","88",date,2);
var date = date_create_datetime(2020,7,2,1,1,1); scr_score_add_index("Rolling Green","PA","blue","89",date);
var date = date_create_datetime(2020,7,5,1,1,1); scr_score_add_index("Shore Gate","NJ","white","84",date);
var date = date_create_datetime(2020,7,18,1,1,1); scr_score_add_index("West Bridgewater Country Club","MA","gold","78",date);
var date = date_create_datetime(2020,7,19,1,1,1); scr_score_add_index("Olde Scottish Links","MA","black","87",date,1);
var date = date_create_datetime(2020,7,26,1,1,1); scr_score_add_index("Crosswinds-Jones/Zaharias","MA","gold","87",date);
var date = date_create_datetime(2020,8,2,1,1,1); scr_score_add_index("Olde Scottish Links","MA","blue","83",date,1);
var date = date_create_datetime(2020,8,8,1,1,1); scr_score_add_index("Atlantic Country Club","MA","gold","80",date);
var date = date_create_datetime(2020,8,14,1,1,1); scr_score_add_index("Vineyard Golf","NJ","white","83",date);
var date = date_create_datetime(2020,8,22,1,1,1); scr_score_add_index("Campbell's Scottish Highlands","NH","blue","77",date);
var date = date_create_datetime(2020,8,30,1,1,1); scr_score_add_index("West Bridgewater Country Club","MA","gold","89",date);
var date = date_create_datetime(2020,9,4,1,1,1); scr_score_add_index("McCullough's Emerald Links","NJ","white","80",date);
var date = date_create_datetime(2020,9,26,1,1,1); scr_score_add_index("West Bridgewater Country Club","MA","gold","91",date,2);
var date = date_create_datetime(2020,9,30,1,1,1); scr_score_add_index("Bass Rocks","MA","gold","79",date,1);
var date = date_create_datetime(2020,10,3,1,1,1); scr_score_add_index("Crotched Mountain","NH","blue","87",date,2);
var date = date_create_datetime(2020,10,11,1,1,1); scr_score_add_index("Olde Scottish Links","MA","blue","85",date,2);
var date = date_create_datetime(2020,11,8,1,1,1); scr_score_add_index("Stow Acres C. C.-North Course","MA","blue","85",date,2);
var date = date_create_datetime(2020,11,21,1,1,1); scr_score_add_index("Crystal Lake Golf Club","RI","blue","83",date);
var date = date_create_datetime(2020,11,25,1,1,1); scr_score_add_index("Riverwinds","NJ","green","85",date);
var date = date_create_datetime(2020,11,28,1,1,1); scr_score_add_index("McCullough's Emerald Links","NJ","blue","83",date);
var date = date_create_datetime(2021,3,23,1,1,1); scr_score_add_index("Running Deer","NJ","white","80",date);
var date = date_create_datetime(2021,4,20,1,1,1); scr_score_add_index("Rolling Green","PA","black","86",date);
var date = date_create_datetime(2021,5,1,1,1,1); scr_score_add_index("Rancocas Golf Club","NJ","black","84",date);
var date = date_create_datetime(2021,5,9,1,1,1); scr_score_add_index("Westwood Golf Club","NJ","black","84",date,1);
var date = date_create_datetime(2021,5,11,1,1,1); scr_score_add_index("Wedgewood Country Club","NJ","black","88",date);
var date = date_create_datetime(2021,7,11,1,1,1); scr_score_add_index("The Links Golf Club","NJ","white","77",date);
var date = date_create_datetime(2022,4,22,1,1,1); scr_score_add_index("Glen Mills","PA","blue","84",date);
var date = date_create_datetime(2022,7,13,1,1,1); scr_score_add_index("Blue Heron","NJ","white","86",date);
var date = date_create_datetime(2022,10,16,1,1,1); scr_score_add_index("Woodmont Country Club - Cypress","FL","blue","84",date);
var date = date_create_datetime(2023,4,16,1,1,1); scr_score_add_index("Flamingo Lakes","FL","blue","81",date);
var date = date_create_datetime(2023,8,14,1,1,1); scr_score_add_index("Osprey Point","FL","gold","89",date);
var date = date_create_datetime(2023,8,14,1,1,1); scr_score_add_index("Estrella Del Mar","FL","white","78",date);

scoresort;

// set to megan's profile
scr_profile_set(1);

var date = date_create_datetime(2020,9,20,1,1,1); scr_score_add_index("Olde Scottish Links","MA","green","134",date,4);
var date = date_create_datetime(2020,9,26,1,1,1); scr_score_add_index("West Bridgewater Country Club","MA","red","119",date);
var date = date_create_datetime(2020,10,3,1,1,1); scr_score_add_index("Crotched Mountain","NH","red","150",date,5);

scoresort;

}