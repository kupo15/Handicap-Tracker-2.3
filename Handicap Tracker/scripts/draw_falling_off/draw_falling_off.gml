
function draw_falling_off(xx,yy) {
exit
// draw round that will be getting kicked out
var rows = 1;
var sep = 110;
var ww = room_width;
var hh = rows*sep;
var height = 40;
var list_size = ds_list_size(master_score_list);

draw_text_height(xx+10,yy-85,"Round Falling Off",50,fn_italic);

for(var i=0;i<rows;i++)
	{
	var slot = clamp(round_selection-1,0,list_size-1);
	var score_pointer = master_score_list[| slot];
	var course_name = score_pointer[| score_data.course];
	var course_tee = ds_list_find_index(teebox_list,score_pointer[| score_data.tee]);
	var course_yardage = score_pointer[| score_data.yardage];
	var course_slope = score_pointer[| score_data.slope];
	var course_rating = score_pointer[| score_data.rating];
	var _score = score_pointer[| score_data.score_];
	var date = score_pointer[| score_data.date];
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_string = string(month)+"/"+string(day)+"/"+string(year);
	var off_pos = i; // slot-score_list_offset;
	
	var active = "";
	if active_scores_grid[# 3,slot]
	active = "*";

	var course_str = string_abbreviate(course_name,600,60,"...");
	draw_text_height(xx+10,yy-15+(off_pos*sep),course_str,height); // draw course name
	draw_text_height(xx+425,yy+45+(off_pos*sep),_score+active,65,fn_bold); // draw score shot
	
	var str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
	draw_tee_marker(xx+20,yy+90+(off_pos*sep),8,course_tee); // draw tee marker
	draw_text_height(xx+35,yy+75+(off_pos*sep),str,36); // draw slope/rating
	draw_text_height(xx+40,yy+30+(off_pos*sep),date_string,36); // draw date played

	draw_line_pixel(25,yy+((1+off_pos)*sep),room_width,1,c_black,0.2); // draw row lines
	}

// if clicked
if click_region_released(0,yy-100,ww,hh+100,c_yellow,navbar.main)
	{
	screenIndex = screen.score_card;
	submenu = navbar.hidden;
	}

}
