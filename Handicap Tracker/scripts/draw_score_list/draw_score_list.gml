function draw_score_list() {
var col = c_lt_gray;
draw_clear(col);

var xx = 20;
var yy = header_height;
var height = 35;
var sep = 120;
var ww = app_width;
var hh = app_height-nav_height-yy-80-20;
var rows = hh/sep;
var col = make_color_rgb(232,237,255);
var box_hh_end = yy+hh;

draw_roundrect_color(0,yy,ww,box_hh_end,c_white,c_white,false);

var list_size = array_length(scorelist_array);
var pos_start = floor(score_list_offset);
var pos_end = min(list_size,ceil(score_list_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_pos = i-score_list_offset;

	var score_pointer = scorelist_array[i];
	var course_name = score_pointer.courseName;
	var course_tee = score_pointer.teeColor;
	var course_yardage = score_pointer.teeYardage;
	var course_slope = score_pointer.teeSlope;
	var course_rating = score_pointer.teeRating;
	var _score = score_pointer.roundScore;
	var strokes = score_pointer.roundStrokes;
	var course_esr = score_pointer.esr;
	var course_practice = score_pointer.practiceRound;
	//var index = score_pointer.indexHistory;

	var date = score_pointer.roundDate;
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_string = string(month)+"/"+string(day)+"/"+string(year);
	
	//var course_handicap = score_pointer.courseHandicap;
	//draw_text_height(xx+390,yy+50+(off_pos*sep),course_handicap,40); // draw score shot
	//draw_text_height(xx+390,yy+(off_pos*sep),course_esr,40); // draw score shot

	var course_str = string_abbreviate(course_name,380,height,"...");
	draw_text_height(xx,yy+10+(off_pos*sep),course_str,height); // draw course name
	draw_text_height(xx+425,yy+15+(off_pos*sep),real(_score)-real(strokes),50); // draw score shot
	
	if strokes != 0
	draw_text_height(xx+472,yy+15+(off_pos*sep),"+"+string(strokes),20); // draw strokes given
	
	// tee info
	var str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
	draw_tee_marker(xx+10,yy+55+(off_pos*sep),30,course_tee,str,true); // draw tee marker
	
	if course_practice
	draw_text_height_color(xx+13,yy+95+(off_pos*sep),"Practice Round",c_red,20,fn_italic);

	draw_text_height_color(xx+270,yy+65+(off_pos*sep),date_string,c_gray,23); // draw date played
			
	// draw_text_height(xx,yy+45+(off_pos*sep),i+1,height); // i
	// draw_text_height(xx+35,yy+40+(off_pos*sep),string_format(course_handicap,2,1),36); // draw course handicap
	
	// var index_history = score_pointer.indexHistory;
	// draw_text_height(xx+105,yy+40+(off_pos*sep),string_format(index_history,2,1),36); // draw index
	
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
			
			score_struct = scorelist_array[score_index];
			workingStruct = struct_copy(score_struct);
			activeStruct = workingStruct;
			
			// set switch tabs
			switchTabDisp[0] = score_struct.practiceRound;
			switchTabDispEnd[0] = score_struct.practiceRound;
				
			// change screen
			screen_change(screen.score_view);		
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
draw_screen_header(headerType.back,headerType.none,"Round History");
	
#region new score button
var hh = 80;
var xx = 0;
var ww = app_width-xx-xx;
var yy = room_height-hh-nav_height-10;

// draw lt gray cover
draw_rectangle_color(0,box_hh_end,app_width,app_height,col,col,col,col,false);	

// clicked on score create
if click_button(xx,yy,"Add Score",50,c_black,ww,hh,c_white,true,false,navbar.main)
	{
	var date = date_current_datetime();
	
	score_struct = scr_score_create("","","","","","","",date,"0"); // create a new score row
	workingStruct = struct_copy(score_struct);
	activeStruct = workingStruct;
			
	score_index = array_length(scorelist_array);

	popup_coursebar();
	screen_change(screen.score_create);
	}
	
draw_plus_button(xx+130,yy+(hh*0.5)-3,70,false);

#endregion
	

}
