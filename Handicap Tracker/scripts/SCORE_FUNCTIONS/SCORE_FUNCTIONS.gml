
function scr_score_update_offseason(scoreStruct) {

var round_pointer = scoreStruct.roundData;
var roundDate = round_pointer.roundDate;

var district_index = scoreStruct.districtInd;
var location_pointer = scoreStruct.courseLocation.districts[district_index];
var seasonStart = location_pointer.startSeason;
var seasonEnd = location_pointer.endSeason;
		
return date_within(roundDate,seasonStart,seasonEnd,true);	
}