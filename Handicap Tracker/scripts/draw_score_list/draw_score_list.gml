function draw_score_list() {
	
var xx = 20;
var yy = 100;
var height = 35;
var sep = 120;
var ww = app_width;
var hh = app_height-sep-yy;
var rows = hh/sep;
var col = make_color_rgb(232,237,255);

var list_size = array_length(scorelist_array);
var pos_start = floor(score_list_offset);
var pos_end = min(list_size,ceil(score_list_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var score_pointer = scorelist_array[i];
	var course_name = score_pointer.courseName;
	var course_tee = score_pointer.teeColor;
	var course_yardage = score_pointer.courseYardage;
	var course_slope = score_pointer.courseSlope;
	var course_rating = score_pointer.courseRating;
	var _score = score_pointer.roundScore;
	var strokes = score_pointer.roundStrokes;
	var course_esr = score_pointer.esr;
	
	var date = score_pointer.roundDate;
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_string = string(month)+"/"+string(day)+"/"+string(year);
	var off_pos = i-score_list_offset;
	
	//var course_handicap = score_pointer.courseHandicap;
	//draw_text_height(xx+390,yy+50+(off_pos*sep),course_handicap,40); // draw score shot
	//draw_text_height(xx+390,yy+(off_pos*sep),course_esr,40); // draw score shot

	var course_str = string_abbreviate(course_name,380,height,"...");
	draw_text_height(xx,yy+20+(off_pos*sep),course_str,height); // draw course name
	draw_text_height(xx+425,yy+15+(off_pos*sep),real(_score)-real(strokes),50); // draw score shot
	
	if strokes != 0
	draw_text_height(xx+472,yy+15+(off_pos*sep),"+"+string(strokes),20); // draw strokes given
	
	// tee info
	var str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
	draw_tee_marker(xx+10,yy+70+(off_pos*sep),30,course_tee,str,true); // draw tee marker

	draw_text_height_color(xx+270,yy+80+(off_pos*sep),date_string,c_gray,23); // draw date played
			
	// draw_text_height(xx,yy+45+(off_pos*sep),i+1,height); // i
	// draw_text_height(xx+35,yy+40+(off_pos*sep),string_format(course_handicap,2,1),36); // draw course handicap
	
	// var index_history = score_pointer.indexHistory;
	// draw_text_height(xx+105,yy+40+(off_pos*sep),string_format(index_history,2,1),36); // draw index


/*
	draw_text_height(xx+15,yy+75+(off_pos*sep),string(course_slope)+" / "+string(course_rating),36); // draw slope/rating
	draw_tee_marker(xx+200,yy+90+(off_pos*sep),8,course_tee); // draw tee marker
	draw_text_height(xx+220,yy+75+(off_pos*sep),string(course_yardage),36); // draw yardage
	draw_text_height(xx+360,yy+75+(off_pos*sep),date_string,36); // draw date played*/
	
	draw_line_pixel(25,yy+((1+off_pos)*sep),room_width,1,c_black,0.2); // draw row lines
	
	// click released on score
	if click_region_released_clamp_array(0,yy,(off_pos*sep),ww,sep,hh,mb_left,c_yellow,navbar.main,i,scorelist_array)
		{
		if mode_delete
			{
			if can_delete
			deleteList[| i] = !deleteList[| i]; // toggle selected
			
			can_delete = true;
			}
		else // select score
		    {
		    score_index = i;
			course_struct = course_find_array(course_name);
			score_struct = struct_copy(scorelist_array[score_index]);
				
			// change screen
			screen_change(screen.edit_score);		
			scr_tee_filled_set();
			}
		}
	}
	
#region scrolling
var offset_start_pointer = [self,"score_list_offset_start"];
var offset_pointer = [self,"score_list_offset"];
var scrollbar_index = 0;
var xx = 0;
var sub = navbar.main;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion
    
// Header
draw_screen_header(headerType.back,headerType.none,"Score History");
	
// new score button
var ww = app_width;
var hh = sep;
var xx = 0;
var yy = room_height-hh-(nav_height*nav_sca_off);

if click_button(xx,yy,"Add Score",50,c_black,ww,hh,c_white,false,true,navbar.main)
	{
	var date = date_current_datetime();
	index = scr_score_add("","","","","","","",date,"0"); // create a new score row
	temp_score = "";
	temp_strokes = "";
	popup_coursebar();
	screenIndex = screen.add_score;
	}
	

}
