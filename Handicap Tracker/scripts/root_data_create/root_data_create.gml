function root_data_create() {
	
profile_index = 0;
rounds_played = 0;
subcourse_index = 0;
		
statslist_array = array_create(0); // culled stats list
courselist_array = array_create(0); // local courses added
scorelist_array = array_create(0); // local scorelist
handicap_season_array = array_create(0);

ini_handicap_season(); // create db of location's golf season
var course_db = debug_data_courses_database();

ROOT_data_struct = {
	
	courselistDatabase: course_db,
	seasonList: handicap_season_array,
	profiles: [],
	
	meta: {
		profileIndex: 0,
		scoreSort: score_sort.currentYear,
		courseSort: course_sort.abc,
		version: json_version,
		},
	}
}


function debug_data_courses_database() {
	
// debug
var arr = [];
var courseStruct = scr_course_create_database(arr,"Atlantic Country Club","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"gold","6728","137","73.1","72");

var courseStruct = scr_course_create_database(arr,"Apple Mountain Golf","NJ",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6668","124","71.9","70");

var courseStruct = scr_course_create_database(arr,"Bass Rocks","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"gold","5953","124","69.3","69");

var courseStruct = scr_course_create_database(arr,"Braintree Municipal","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","6212","123","70.0","72");

var courseStruct = scr_course_create_database(arr,"Broad Run Golf Club","PA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","6080","132","70.3","72");

var courseStruct = scr_course_create_database(arr,"Campbell's Scottish Highlands","NH",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6249","121","70.1","71");

var courseStruct = scr_course_create_database(arr,"Cape May National","NJ",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","6063","125","69.0","71");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6592","130","71.4","71");

var courseStruct = scr_course_create_database(arr,"Charleston Springs","NJ",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"gold","6374","121","70.3","72");

var courseStruct = scr_course_create_database(arr,"Crosswinds-Jones/Zaharias","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"gold","6520","134","71.9","72");

var courseStruct = scr_course_create_database(arr,"Crotched Mountain","NH",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"red","4604","117","67.4","71");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6277","125","69.2","71");

var courseStruct = scr_course_create_database(arr,"Crumpin Fox Club","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6508","141","72.2","72");

var courseStruct = scr_course_create_database(arr,"Crystal Lake Golf Club","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6501","129","71.9","72");

var courseStruct = scr_course_create_database(arr,"Gardner Municipal","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6131","128","69.8","71");

var courseStruct = scr_course_create_database(arr,"Granite Fields Golf Club","NH",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6543","130","71.7","72");

var courseStruct = scr_course_create_database(arr,"Hickory Hills","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","6020","119","69.6","71");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6287","123","70.8","71");

var courseStruct = scr_course_create_database(arr,"Highfields","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"gold","6474","134","71.7","72");

var courseStruct = scr_course_create_database(arr,"Ledges Golf Club","ME",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"black","6981","137","74.2","72");

var courseStruct = scr_course_create_database(arr,"McCullough's Emerald Links","NJ",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","6132","125","69.8","71");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6535","135","72.2","71");

var courseStruct = scr_course_create_database(arr,"Nashua Country Club","NH",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","5965","126","69.8","71");

var courseStruct = scr_course_create_database(arr,"Newton Commonwealth","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","5354","119","67.0","70");

var courseStruct = scr_course_create_database(arr,"Olde Scottish Links","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"green","5396","110","65.9","72");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6306","124","70.3","72");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"black","6790","126","72.6","72");

var courseStruct = scr_course_create_database(arr,"Pembroke Country Club","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6677","132","73.3","71");

var courseStruct = scr_course_create_database(arr,"Pinehills - Nicklaus","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6640","131","72.2","72");

var courseStruct = scr_course_create_database(arr,"Putterham Meadows","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","5859","116","68.1","70");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6208","124","70.0","70");

var courseStruct = scr_course_create_database(arr,"West Bridgewater Country Club","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"red","4915","120","67.7","71");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"gold","6659","127","70.9","71");

var courseStruct = scr_course_create_database(arr,"Riverwinds","NJ",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","6576","128","70.3","72");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6843","132","72.3","72");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"black","7086","135","73.8","72");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"green","6544","126","70.8","72");

var courseStruct = scr_course_create_database(arr,"Rolling Green","PA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6695","140","73.7","71");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"black","6941","143","74.7","70");

var courseStruct = scr_course_create_database(arr,"Sagamore Spring","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"black","5972","125","69.1","70");

var courseStruct = scr_course_create_database(arr,"Shore Gate","NJ",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","6391","137","71.0","72");

var courseStruct = scr_course_create_database(arr,"Souhegan Woods","NH",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6507","125","70.3","72");

var courseStruct = scr_course_create_database(arr,"South Shore Country Club","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6470","132","70.6","72");

var courseStruct = scr_course_create_database(arr,"Stow Acres C. C.-North Course","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","7001","130","73.7","72");

var courseStruct = scr_course_create_database(arr,"Stow Acres C. C.-South Course","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6520","128","71.7","72");

var courseStruct = scr_course_create_database(arr,"Vineyard Golf","NJ",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","6358","125","70.4","72");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6746","129","72.0","72");

var courseStruct = scr_course_create_database(arr,"Waverly Oaks","MA",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"gold","6682","124","72.3","72");

var courseStruct = scr_course_create_database(arr,"Windham Country Club","NH",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6033","130","69.1","72");

var courseStruct = scr_course_create_database(arr,"Crystal Lake Golf Club","RI",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","5966","119","69.1","71");

var courseStruct = scr_course_create_database(arr,"Running Deer","NJ",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"black","7132","130","73.9","72");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"blue","6773","126","72.1","72");
scr_course_tee_add(courseStruct.subcourses[0].teeData,"white","6414","122","70.5","72");

var courseStruct = scr_course_create_database(arr,"Rancocas Golf Club","NJ",undefined);
scr_course_tee_add(courseStruct.subcourses[0].teeData,"black","6602","135","71.3","71");

//array_sort_nested_struct(arr,"courseName",true);

db(string(array_length(arr))+" courses created");

return arr;
}