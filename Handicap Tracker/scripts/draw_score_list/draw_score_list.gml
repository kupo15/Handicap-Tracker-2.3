function draw_score_list() {
var course_next = false;
var xx = 20;
var yy = 100;
var height = 40;
var rows = score_list_row;
var sep = 110;
var ww = 540;
var hh = rows*sep;

var list_size = ds_list_size(master_score_list);
var pos_start = floor(score_list_offset);
var pos_end = min(list_size,ceil(score_list_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var score_pointer = master_score_list[| i];
	var course_name = score_pointer[| score_data.course];
	var course_tee = ds_list_find_index(teebox_list,score_pointer[| score_data.tee]);
	var course_yardage = score_pointer[| score_data.yardage];
	var course_slope = score_pointer[| score_data.slope];
	var course_rating = score_pointer[| score_data.rating];
	var _score = score_pointer[| score_data.score_];
	var strokes = score_pointer[| score_data.strokes];
	var course_handicap = score_pointer[| score_data.course_handicap];
	var index_history = score_pointer[| score_data.index];
	var course_esr = score_pointer[| score_data.esr];
	
	var date = score_pointer[| score_data.date];
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_string = string(month)+"/"+string(day)+"/"+string(year);
	var off_pos = i-score_list_offset;
	
	//	draw_text_height(xx+390,yy+50+(off_pos*sep),course_handicap,40); // draw score shot
	//	draw_text_height(xx+390,yy+(off_pos*sep),course_esr,40); // draw score shot

	// highlight selected
	if mode_delete
	delete_list_draw_selected(0,yy+(off_pos*sep),ww,sep,deleteList,i);

	var course_str = string_abbreviate(course_name,560,60,"...");
	draw_text_height(xx,yy+15+(off_pos*sep),course_str,height); // draw course name
	draw_text_height(xx+425,yy+15+(off_pos*sep),real(_score)-real(strokes),60); // draw score shot
	
	if strokes != 0
	draw_text_height(xx+488,yy+30+(off_pos*sep),"+"+string(strokes),30); // draw strokes given
	
	var str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
	draw_tee_marker(xx+15,yy+90+(off_pos*sep),8,course_tee); // draw tee marker
	draw_text_height(xx+35,yy+75+(off_pos*sep),str,36); // draw slope/rating
	draw_text_height(xx+360,yy+75+(off_pos*sep),date_string,36); // draw date played
			
	//    draw_text_height(xx,yy+45+(off_pos*sep),i+1,height); // i
	//    draw_text_height(xx+35,yy+40+(off_pos*sep),string_format(course_handicap,2,1),36); // draw course handicap
	//    draw_text_height(xx+105,yy+40+(off_pos*sep),string_format(index_history,2,1),36); // draw index


/*
	draw_text_height(xx+15,yy+75+(off_pos*sep),string(course_slope)+" / "+string(course_rating),36); // draw slope/rating
	draw_tee_marker(xx+200,yy+90+(off_pos*sep),8,course_tee); // draw tee marker
	draw_text_height(xx+220,yy+75+(off_pos*sep),string(course_yardage),36); // draw yardage
	draw_text_height(xx+360,yy+75+(off_pos*sep),date_string,36); // draw date played*/
	
	draw_line_pixel(25,yy+((1+off_pos)*sep),room_width,1,c_black,0.2); // draw row lines

	// clicked on score
	if !mode_delete && click_region_pressed_clamp(0,yy,(off_pos*sep),ww,sep,hh,mb_left,noone,navbar.main,i)
	delete_list_set(master_score_list,i);
	
	// set highlight ypos and height
	if click_region(xx,yy+(off_pos*sep),ww,sep,noone,noone)
	click_highlight_set_clamped(yy,off_pos,sep,hh);

	// click released on score
	if click_region_released_clamp(0,yy,(off_pos*sep),ww,sep,hh,mb_left,c_yellow,navbar.main)
		{
		if mode_delete
			{
			if can_delete
			deleteList[| i] = !deleteList[| i]; // toggle selected
			
			can_delete = true;
			}
		else // select score
		    {
		    index = i;
			course_next = true;
			course_id = noone;
			screenIndex = screen.edit_score;
			submenu = navbar.hidden;
		
			var score_pointer = master_score_list[| index];
			temp_score = score_pointer[| score_data.score_];
			temp_strokes = score_pointer[| score_data.strokes];
			if temp_strokes == "0" temp_strokes = "";
			
			temp_score_tee = score_pointer[| score_data.tee];
			temp_score_yardage = score_pointer[| score_data.yardage];
			temp_score_slope = score_pointer[| score_data.slope];
			temp_score_rating = score_pointer[| score_data.rating];
			temp_score_par = score_pointer[| score_data.par];
			
			/*temp_course_tee = score_pointer[| score_data.tee];
			temp_course_yardage = score_pointer[| score_data.yardage];
			temp_course_slope = score_pointer[| score_data.slope];
			temp_course_rating = score_pointer[| score_data.rating];
			temp_course_par = score_pointer[| score_data.par];*/
								
			var course_size = ds_list_size(master_course_list);
			for(var i=0;i<course_size;i++) // loop through course list
				{
				var pointer = master_course_list[| i];
				var name = pointer[| course_data.name]; // course name
				
				if score_pointer[| score_data.course] == name
					{
					course_id = pointer;
					break;
					}	
				}
			
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

	//funct_dialogue_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
	funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion
    
// Header
draw_screen_header(headerType.back,headerType.none,"ADJ. Score History");
	
// new score button
var ww = 540;
var hh = 95;
var xx = 0;
var yy = room_height-hh-(nav_height*nav_sca_off);
var col = c_white;

draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
draw_rectangle(xx,yy,xx+ww,yy+hh,true);
draw_set_halign(fa_center);
draw_text_height(540/2,yy+15,"Add Score",70);

if click_region_released(xx,yy,ww,hh,true,noone)
	{
	var date = date_current_datetime();
	index = scr_score_add("","","","","","","",date,"0"); // create a new score row
	course_next = true;
	temp_score = "";
	temp_strokes = "";
	popup_coursebar();
	screenIndex = screen.add_score;
	}
	
if course_next
	{
	}




}
