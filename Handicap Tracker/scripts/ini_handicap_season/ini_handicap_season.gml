function handicap_season_district_add(district,allYear,startDate,endDate) {
/// @param district
/// @param allYear	
/// @param [startdate
/// @param endDate]

var ins = argument[2];
var ins = argument[3];	

if !allYear
	{
	var start_month = floor(startDate);
	var start_day = frac_whole(startDate);
	startDate = date_create_datetime(current_year,start_month,start_day,1,1,1);
	
	var end_month = floor(endDate);
	var end_day = frac_whole(endDate);
	endDate = date_create_datetime(current_year,end_month,end_day,1,1,1);
	}
	
var district_data = {
	
	districtName: district,
	yearRound: allYear,
	startSeason: startDate,
	endSeason: endDate,	
	}

array_push(season_data.districts,district_data);
}

function handicap_season_state_add(state,initial) {
/// @param state

season_data = {
	
	stateName: state,
	stateInitial: initial,
	districts: [],
}

array_push(handicap_season_array,season_data);
}

function ini_handicap_season() {
	
handicap_season_state_add("Alabama","AL");
handicap_season_district_add("Alabama Golf Association",true);

handicap_season_state_add("Alaska","AK");
handicap_season_district_add("Alaska Golf Association",false,4.1,10.31);

handicap_season_state_add("Arizona","AZ");
handicap_season_district_add("Arizona Golf Association",true);

handicap_season_state_add("Arkansas","AR");
handicap_season_district_add("Arkansas State Golf Association",true);

handicap_season_state_add("California","CA");
handicap_season_district_add("Northern California Golf Association",true);
handicap_season_district_add("Southern California Golf Association",true);

handicap_season_state_add("Colorado","CO");
handicap_season_district_add("Colorado Golf Association",false,3.15,11.14);

handicap_season_state_add("Connecticut","CT");
handicap_season_district_add("Connecticut State Golf Association",false,4.1,11.14);

handicap_season_state_add("Delaware","DE");
handicap_season_district_add("Delaware State Golf Association",false,4.1,11.14);

handicap_season_state_add("Florida","FL");
handicap_season_district_add("Florida State Golf Association",true);

handicap_season_state_add("Georgia","GA");
handicap_season_district_add("Georgia State Golf Association",true);

handicap_season_state_add("Guam","GU");
handicap_season_district_add("Guam National Golf Federation",true);

handicap_season_state_add("Hawaii","HI");
handicap_season_district_add("Hawaii State Golf Association",true);

handicap_season_state_add("Idaho","ID");
handicap_season_district_add("Idaho Golf Association",false,3.1,11.14);

handicap_season_state_add("Illinois","IL");
handicap_season_district_add("Chicago District Golf Association",false,4.1,10.31);

handicap_season_state_add("Indiana","IN");
handicap_season_district_add("Indiana Golf Association",false,3.1,11.14);

handicap_season_state_add("Iowa","IA");
handicap_season_district_add("Iowa Golf Association",false,4.1,11.14);

handicap_season_state_add("Kansas","KS");
handicap_season_district_add("Central Links Golf",false,3.1,12.31);

handicap_season_state_add("Kentucky","KY");
handicap_season_district_add("Kentucky Golf Association",false,3.1,11.30);

handicap_season_state_add("Louisana","LA");
handicap_season_district_add("Louisana Golf Association",true);

handicap_season_state_add("Maine","ME");
handicap_season_district_add("Maine State Golf Association",false,4.15,11.14);

handicap_season_state_add("Maryland","MD");
handicap_season_district_add("Maryland State Golf Association",false,3.15,11.14);

handicap_season_state_add("Massachusetts","MA");
handicap_season_district_add("Massachusetts Golf Association",false,4.1,11.14);

handicap_season_state_add("Michigan","MI");
handicap_season_district_add("Golf Association of Michigan",false,4.1,10.31);

handicap_season_state_add("Minnesota","MN");
handicap_season_district_add("Minnesota Golf Association",false,4.1,10.31);

handicap_season_state_add("Mississippi","MS");
handicap_season_district_add("Mississippi Golf Association",true);

handicap_season_state_add("Missouri","MO");
handicap_season_district_add("Metropolitan Amateur Golf Association",false,3.1,11.14);
handicap_season_district_add("Missouri Golf Association",false,3.1,11.14);

handicap_season_state_add("Montana","MT");
handicap_season_district_add("Montana State Golf Association",false,4.1,10.31);

handicap_season_state_add("Nebraska","NE");
handicap_season_district_add("Nebraska Golf Association",false,3.15,11.14);

handicap_season_state_add("New Hampshire","NH");
handicap_season_district_add("New Hampshire Golf Association",false,4.1,10.31);

handicap_season_state_add("New Jersey","NJ");
handicap_season_district_add("New Jersey State Golf Association",false,4.1,11.14);

handicap_season_state_add("New Mexico","NM");
handicap_season_district_add("Sun Country Amateur Golf Association",true);

handicap_season_state_add("New York","NY");
handicap_season_district_add("Metropolitan Golf Association",false,4.1,11.14);
handicap_season_district_add("New York State Golf Association",false,4.15,10.31);
handicap_season_district_add("Rochester District Golf Association",false,4.15,10.31);

handicap_season_state_add("Nevada","NV");
handicap_season_district_add("Northern Nevada Golf Association",false,3.15,11.30);
handicap_season_district_add("Southern Nevada Golf Association",true);

handicap_season_state_add("North Carolina","NC");
handicap_season_district_add("Carolinas Golf Association",true);

handicap_season_state_add("North Dakota","ND");
handicap_season_district_add("North Dakota Golf Association",false,3.15,11.15);

handicap_season_state_add("Ohio","OH");
handicap_season_district_add("Greater Cincinnati Golf Association",false,3.15,11.14);
handicap_season_district_add("Miami Valley Golf Association",false,3.15,11.30);
handicap_season_district_add("Northern Ohio Golf Association",false,4.1,10.31);
handicap_season_district_add("Ohio Golf Association",false,3.15,11.30);
handicap_season_district_add("Toledo District Golf Association",false,4.1,10.31);

handicap_season_state_add("Oklahoma","OK");
handicap_season_district_add("Oklahoma Golf Association",true);

handicap_season_state_add("Oregon","OR");
handicap_season_district_add("Oregon Golf Association",false,3.1,11.30);

handicap_season_state_add("Pennsylvania","PA");
handicap_season_district_add("Golf Association of Philadelphia",false,4.1,11.14);
handicap_season_district_add("Western Pennsylvania Golf Association",false,4.1,11.14);

handicap_season_state_add("Puerto Rico","PR");
handicap_season_district_add("Puerto Rico Golf Association",true);

handicap_season_state_add("Rhode Island","RI");
handicap_season_district_add("Rhode Island Golf Association",false,4.1,11.14);

handicap_season_state_add("South Carolina","SC");
handicap_season_district_add("Carolinas Golf Association",true);

handicap_season_state_add("South Dakota","SD");
handicap_season_district_add("South Dakota Golf Association",false,4.1,10.31);

handicap_season_state_add("Tennessee","TN");
handicap_season_district_add("Tennessee Golf Association",true);

handicap_season_state_add("Texas","TX");
handicap_season_district_add("Texas Golf Association",true);

handicap_season_state_add("Utah","UT");
handicap_season_district_add("Southern Utah Golf Association",true);
handicap_season_district_add("Northern Utah Golf Association",false,3.15,11.14);

handicap_season_state_add("Vermont","VT");
handicap_season_district_add("Vermont Golf Association",false,4.15,10.31);

handicap_season_state_add("Virginia","VA");
handicap_season_district_add("Virginia State Golf Association",true);

handicap_season_state_add("Washington","WA");
handicap_season_district_add("Washington State Golf Association",true);

handicap_season_state_add("West Virginia","WV");
handicap_season_district_add("West Virigina Golf Association",false,3.1,10.31);

handicap_season_state_add("Wisconsin","WI");
handicap_season_district_add("Wisconsin State Golf Association",false,4.1,10.31);

handicap_season_state_add("Wyoming","WY");
handicap_season_district_add("Wyoming State Golf Association",false,4.1,10.31);

season_data = undefined;
}

function scr_handicap_season_date(district_pointer) {
	
var start_month = date_get_month(district_pointer.startSeason);
var month_str = funct_convert_month(start_month,false);
var start_day = date_get_day(district_pointer.startSeason);
var startDate_str = month_str+" "+string(start_day);

var end_month = date_get_month(district_pointer.endSeason);
var month_str = funct_convert_month(end_month,false);
var end_day = date_get_day(district_pointer.endSeason);
var endDate_str = month_str+" "+string(end_day);
			
return startDate_str+"-"+endDate_str;	
}