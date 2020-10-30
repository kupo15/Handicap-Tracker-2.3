/// @param date
function scr_set_date_offsets(date) {

	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);

	var curr_date = date_create_datetime(year,month,day,0,0,0);
	var month = floor(date_month_span(start_date,curr_date)); // ((year-1970)*12)+month;

	month_offset = month;
	month_offset_start = month;
	month_offset_end = month;

	day_span_select = round(date_day_span(start_date,curr_date))+1;

	day_offset = day;
	day_offset_start = day;
	day_offset_end = day;

	year_offset = year;
	year_offset_start = year;
	year_offset_end = year;


}
