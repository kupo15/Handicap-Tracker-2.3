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

var num = array_length(season_data.districts);
season_data.districts[num] = district_data;
}

function handicap_season_state_add(state) {
/// @param state

season_data = {
	
	stateName: state,
	districts: [],
}

array_push(handicap_season_array,season_data);
}

function ini_handicap_season() {
	
handicap_season_state_add("Alabama");
handicap_season_district_add("Alabama Golf Association",true);

handicap_season_state_add("Alaska");
handicap_season_district_add("Alaska Golf Association",false,4.1,10.31);

handicap_season_state_add("Arizona");
handicap_season_district_add("Arizona Golf Association",true);

handicap_season_state_add("Arkansas");
handicap_season_district_add("Arkansas State Golf Association",true);

handicap_season_state_add("California");
handicap_season_district_add("Northern California Golf Association",true);

handicap_season_state_add("California");
handicap_season_district_add("Southern California Golf Association",true);

handicap_season_state_add("Colorado",);
handicap_season_district_add("Colorado Golf Association",false,3.15,11.14);

handicap_season_state_add("Connecticut");
handicap_season_district_add("Connecticut State Golf Association",false,4.1,11.14);

handicap_season_state_add("Delaware");
handicap_season_district_add("Delaware State Golf Association",false,4.1,11.14);

handicap_season_state_add("Florida");
handicap_season_district_add("Florida State Golf Association",true);

handicap_season_state_add("Georgia");
handicap_season_district_add("Georgia State Golf Association",true);

handicap_season_state_add("Guam");
handicap_season_district_add("Guam National Golf Federation",true);

handicap_season_state_add("Hawaii");
handicap_season_district_add("Hawaii State Golf Association",true);

handicap_season_state_add("Idaho");
handicap_season_district_add("Idaho Golf Association",false,3.1,11.14);

handicap_season_state_add("Illinois");
handicap_season_district_add("Chicago District Golf Association",false,4.1,10.31);

handicap_season_state_add("Indiana");
handicap_season_district_add("Indiana Golf Association",false,3.1,11.14);

handicap_season_state_add("Iowa");
handicap_season_district_add("Iowa Golf Association",false,4.1,11.14);

handicap_season_state_add("Kansas");
handicap_season_district_add("Central Links Golf",false,3.1,12.31);

handicap_season_state_add("Kentucky");
handicap_season_district_add("Kentucky Golf Association",false,3.1,11.30);

handicap_season_state_add("Louisana");
handicap_season_district_add("Louisana Golf Association",true);

handicap_season_state_add("Maine");
handicap_season_district_add("Maine State Golf Association",false,4.15,11.14);

handicap_season_state_add("Maryland");
handicap_season_district_add("Maryland State Golf Association",false,3.15,11.14);

handicap_season_state_add("Massachusetts");
handicap_season_district_add("Massachusetts Golf Association",false,4.1,11.14);

handicap_season_state_add("Michigan");
handicap_season_district_add("Golf Association of Michigan",false,4.1,10.31);

handicap_season_state_add("Minnesota");
handicap_season_district_add("Minnesota Golf Association",false,4.1,10.31);

handicap_season_state_add("Mississippi");
handicap_season_district_add("Mississippi Golf Association",true);

handicap_season_state_add("Missouri");
handicap_season_district_add("Metropolitan Amateur Golf Association",false,3.1,11.14);
handicap_season_district_add("Missouri Golf Association",false,3.1,11.14);

handicap_season_state_add("Montana");
handicap_season_district_add("Montana State Golf Association",false,4.1,10.31);

handicap_season_state_add("Nebraska");
handicap_season_district_add("Nebraska Golf Association",false,3.15,11.14);

handicap_season_state_add("New Hampshire");
handicap_season_district_add("New Hampshire Golf Association",false,4.1,10.31);

handicap_season_state_add("New Jersey");
handicap_season_district_add("New Jersey State Golf Association",false,4.1,11.14);

handicap_season_state_add("New Mexico");
handicap_season_district_add("Sun Country Amateur Golf Association",true);

handicap_season_state_add("New York",);
handicap_season_district_add("Metropolitan Golf Association",false,4.1,11.14);
handicap_season_district_add("New York State Golf Association",false,4.15,10.31);
handicap_season_district_add("Rochester District Golf Association",false,4.15,10.31);

handicap_season_state_add("Nevada");
handicap_season_district_add("Northern Nevada Golf Association",false,3.15,11.30);
handicap_season_district_add("Southern Nevada Golf Association",true);

handicap_season_state_add("North Carolina");
handicap_season_district_add("Carolinas Golf Association",true);

handicap_season_state_add("North Dakota");
handicap_season_district_add("North Dakota Golf Association",false,3.15,11.15);

handicap_season_state_add("Ohio");
handicap_season_district_add("Greater Cincinnati Golf Association",false,3.15,11.14);
handicap_season_district_add("Miami Valley Golf Association",false,3.15,11.30);
handicap_season_district_add("Northern Ohio Golf Association",false,4.1,10.31);
handicap_season_district_add("Ohio Golf Association",false,3.15,11.30);
handicap_season_district_add("Toledo District Golf Association",false,4.1,10.31);

handicap_season_state_add("Oklahoma");
handicap_season_district_add("Oklahoma Golf Association",true);

handicap_season_state_add("Oregon");
handicap_season_district_add("Oregon Golf Association",false,3.1,11.30);

handicap_season_state_add("Pennsylvania");
handicap_season_district_add("Golf Association of Philadelphia",false,4.1,11.14);
handicap_season_district_add("Western Pennsylvania Golf Association",false,4.1,11.14);

handicap_season_state_add("Puerto Rico");
handicap_season_district_add("Puerto Rico Golf Association",true);

handicap_season_state_add("Rhode Island");
handicap_season_district_add("Rhode Island Golf Association",false,4.1,11.14);

handicap_season_state_add("South Carolina");
handicap_season_district_add("Carolinas Golf Association",true);

handicap_season_state_add("South Dakota");
handicap_season_district_add("South Dakota Golf Association",false,4.1,10.31);

handicap_season_state_add("Tennessee");
handicap_season_district_add("Tennessee Golf Association",true);

handicap_season_state_add("Texas");
handicap_season_district_add("Texas Golf Association",true);

handicap_season_state_add("Utah");
handicap_season_district_add("Southern Utah Golf Association",true);
handicap_season_district_add("Northern Utah Golf Association",false,3.15,11.14);

handicap_season_state_add("Vermont");
handicap_season_district_add("Vermont Golf Association",false,4.15,10.31);

handicap_season_state_add("Virginia");
handicap_season_district_add("Virginia State Golf Association",true);

handicap_season_state_add("Washington");
handicap_season_district_add("Washington State Golf Association",true);

handicap_season_state_add("West Virginia");
handicap_season_district_add("West Virigina Golf Association",false,3.1,10.31);

handicap_season_state_add("Wisconsin");
handicap_season_district_add("Wisconsin State Golf Association",false,4.1,10.31);

handicap_season_state_add("Wyoming");
handicap_season_district_add("Wyoming State Golf Association",false,4.1,10.31);

season_data = undefined;
}