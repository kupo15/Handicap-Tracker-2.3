function draw_score_list() {
	
var col = c_lt_gray;
draw_clear(col);

// set offsets
var scrollbar_index = offsetScroll.scorelistOffset;
var scorelist_offset = offsetArray[scrollbar_index];
var scorelist_offset_start = offsetArrayStart[scrollbar_index];

#region draw scorelist
var xx = 20;
var yy = header_height+header_submenu_height;
var height = 35;
var sep = 120;
var ww = app_width;
var hh = app_height-nav_height-yy;
var rows = hh/sep;
var col = make_color_rgb(232,237,255);
var box_hh_end = yy+hh;

draw_roundrect_color(0,yy,ww,box_hh_end,c_white,c_white,false);

var list_size = array_length(scorelist_array);

// this year scores
if META_data.scoreSort == score_sort.currentYear
for(var i=0;i<list_size;i++)
	{
	var date_pointer = scorelist_array[i].roundData.roundDate;
	var year = date_get_year(date_pointer);
	
	if year != current_year
		{
		list_size = i;
		break;
		}
	}

var pos_start = floor(scorelist_offset);
var pos_end = min(list_size,ceil(scorelist_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_pos = i-scorelist_offset;

	var score_pointer = scorelist_array[i];
	var course_id = score_pointer.courseID;
	var course_name = score_pointer.courseName;
	
	var tee_pointer = score_pointer.teeData;
	var course_tee = tee_pointer.teeColor;
	var course_yardage = tee_pointer.teeYardage;
	var course_slope = tee_pointer.teeSlope;
	var course_rating = tee_pointer.teeRating;
	
	var round_pointer = score_pointer.roundData;
	var net_score = round_pointer.netScore;
	var strokes = round_pointer.roundStrokes;
	var date = round_pointer.roundDate;
	var month = date_get_month(date);
	var day = date_get_day(date);
	var year = date_get_year(date);
	var date_string = string(month)+"/"+string(day)+"/"+string(year);
	
	var handicap_pointer = score_pointer.handicapData;
	var course_esr = handicap_pointer.esr;
	var course_practice = handicap_pointer.roundType;
	var off_season = handicap_pointer.offSeason;

	// draw elements
	var col = pick(c_black,make_color_rgb(38,72,106),i<20);
	var course_str = string_abbreviate(course_name,460,height,"...");
	
	draw_text_height_color(xx+15,yy+10+(off_pos*sep),course_str,col,height); // draw course name
	
	draw_set_halign(fa_right);
	draw_text_height(xx+465,yy+60+(off_pos*sep),net_score,50); // draw score shot
	draw_set_halign(fa_left);

	if strokes != 0
	draw_text_height(xx+472,yy+60+(off_pos*sep),"+"+string(strokes),20); // draw strokes given
	
	// tee info
	var str = course_yardage+" yds ("+course_slope+" / "+course_rating+")";
	draw_tee_marker(xx+10,yy+55+(off_pos*sep),30,course_tee,str,true); // draw tee marker
	
	if off_season
		{
		var str = pick("Practice Round","Off Season",off_season);
		var str_col = pick(c_red,make_color_rgb(38,72,106),off_season);
		
		draw_text_height_color(xx+15,yy+95+(off_pos*sep),str,str_col,20,fn_italic);
		}

	draw_text_height_color(xx+270,yy+65+(off_pos*sep),date_string,c_gray,23); // draw date played
	
	//var col = pick(c_black,c_red,i==19);
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
			course_struct = database_course_get_pointer(course_id);
			
			score_struct = scorelist_array[score_index];
			workingStruct = struct_copy(score_struct);
			activeStruct = workingStruct;
			
			// set switch tabs
			switchTabDisp[0] = course_practice;
			switchTabDispEnd[0] = course_practice;
				
			// change screen
			screen_change(screen.score_view,navbar.hidden);		
			scr_tee_filled_set();
			}
		}
	}
#endregion	

#region scrolling
var xx = 0;
var sub = navbar.main;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);
#endregion
    
#region Header
var new_score = draw_screen_header(headerType.back,headerType.plus,"Round History");	
if new_score
	{
	score_struct = create_score // create a new score row
	workingStruct = struct_copy(score_struct);
	activeStruct = workingStruct;
			
	score_index = array_length(scorelist_array);

	screen_change(screen.score_create,navbar.coursebar);
	popup_coursebar();
	}
	
// SubHeader
var sort_index = META_data.scoreSort;
var offset = offsetArray[offsetScroll.scoreSortUnderline];
var header = draw_screen_header_submenu(offset,sort_index,current_year,"All");

if (header != undefined) && (header != sort_index)
	{
	scr_score_list_sort(header);
	app_save;
	}	
#endregion

exit;
#region new score button
var hh = 80;
var xx = 0;
var ww = app_width-xx-xx;
var yy = room_height-hh-nav_height-10;	
var col = c_lt_gray;

// draw lt gray cover
draw_rectangle_color(0,box_hh_end,app_width,app_height,col,col,col,col,false);	

// clicked on score create
if click_button(xx,yy,"Add Score",50,c_black,ww,hh,c_white,true,false,navbar.main)
	{
	score_struct = create_score; // create a new score row
	workingStruct = struct_copy(score_struct);
	activeStruct = workingStruct;
			
	score_index = array_length(scorelist_array);

	popup_coursebar();
	screen_change(screen.score_create);
	}
	
draw_plus_button(xx+130,yy+(hh*0.5)-3,70,false);

#endregion
	

}
