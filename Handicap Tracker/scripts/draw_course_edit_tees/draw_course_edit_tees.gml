function draw_course_edit_tees() {

var bg_col = c_lt_gray;
draw_clear(bg_col);

// header
var str = "Course Tees";
draw_screen_header(headerType.back,headerType.none,str);

// textbox entry
switch (textboxIndex)
	{	
	case course_data.yardage: activeStruct.courseYardage = string_convert_real_numpad(numpad_value,4); break;
							  
	case course_data.slope: activeStruct.courseSlope = string_convert_real_numpad(numpad_value,3); break;
							  
	case course_data.rating: activeStruct.courseRating = string_convert_rating_numpad(numpad_value,3); break;
							  
	case course_data.par: activeStruct.coursePar = string_convert_real_numpad(numpad_value,2); break;
	}

var course_tee = teebox_list[| tee_index];
var course_yardage = activeStruct.courseYardage;
var course_slope = activeStruct.courseSlope;
var course_rating = activeStruct.courseRating;
var course_par = activeStruct.coursePar;

#region draw tee 
var xx = 10;
var yy = 100;
var sep = 120;
var height = 50;
var ww = app_width-xx-xx;
var hh = 90;
var col = c_white;

if draw_dialogue_box(xx,yy,ww,hh,col,submenu)
	{
	// potential dropdown tee change
	}
	
// draw tee
draw_text_height(xx+20,yy+10,"Tee",25);
draw_text_height(xx+50,yy+25,course_tee+" Tee",height); // draw course tee markers
#endregion

#region draw tee details
var yy = 200;
var hh = 400;
var dialgue_end = yy+hh;

draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);

var detail_arr = ["Yardage","Slope","Rating","Par"];
var detail_val = [course_yardage,course_slope,course_rating,course_par];

// detail buttons
var size = array_length(detail_arr);
var button_spacing = 10;
var button_sep = ww/size;
var button_ww = button_sep-button_spacing;
var xoff = button_spacing*0.5;

// click on header button
var move = false;

for(var i=0;i<size;i++)
	{
	if click_button(xx+xoff+(i*button_sep),yy+10,detail_arr[i],35,c_black,button_ww,60,c_lt_gray,true,false,submenu)
		{
		textboxIndex = course_data.yardage+i;
		move = true;
		}
	
	// draw values
	draw_text_height(xx+xoff+(button_ww*0.5)+(i*button_sep),yy+10+60,detail_val[i],25);
	}

// draw highlight
draw_set_alpha(0.2);	
draw_dialogue_box(xx+xoff+((textboxIndex-course_data.yardage)*button_sep),yy+10,button_sep-button_spacing,60,header_color,undefined);
draw_set_alpha(1);
#endregion

if virtual_keyboard_enter 
	{
	textboxIndex = clamp(textboxIndex+1,course_data.yardage,course_data.enumcount); // move to next textbox
	move = true;
	}

#region draw forward and back arrows
var button_ww = ww*0.5;
var button_hh = 80;
var height = 70;
var xx = 10;
var yy = dialgue_end-button_hh;
var button_col = make_color_rgb(240,240,240);

if click_button(xx,yy,"<<",height,c_black,button_ww,button_hh,button_col,false,false,submenu)
	{
	textboxIndex = clamp(textboxIndex-1,course_data.yardage,course_data.par);
	move = true;
	}

if click_button(xx+button_ww,yy,">>",height,c_black,button_ww,button_hh,button_col,false,false,submenu)
	{
	textboxIndex = clamp(textboxIndex+1,course_data.yardage,course_data.par);
	move = true;
	}
	
draw_line_pixel(xx+button_ww,yy+10,1,button_hh-20,c_black,1);
	
#endregion

if move
switch (textboxIndex)
	{	
	case course_data.yardage: click_textbox_set(activeStruct.courseYardage,textboxIndex,kbv_type_numbers); break;
	
	case course_data.slope: click_textbox_set(activeStruct.courseSlope,textboxIndex,kbv_type_numbers); break;
	
	case course_data.rating: click_textbox_set(activeStruct.courseRating,textboxIndex,kbv_type_numbers); break;
	
	case course_data.par: click_textbox_set(activeStruct.coursePar,textboxIndex,kbv_type_numbers); break;
	}
	
#region draw label
var xx = app_width*0.5;
var yy = 320;
var height = 60;

draw_set_halign(fa_center);
draw_text_height(xx,yy,detail_arr[textboxIndex-course_data.yardage],height);

// draw value
var height = 70;
draw_text_height(xx,yy+80,detail_val[textboxIndex-course_data.yardage],height);	
#endregion	
	
#region Finished button
var submit = (course_yardage != "") && (course_slope != "") && (course_par != "") && (course_rating != "");
var hh = 60;
var xx = 0;
var yy = app_height-hh;
var height = 40;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,submenu) && submit
	{	
	activeStruct = struct_undo_pop(workingStruct,course_struct,true);

	scr_tee_filled_set(workingStruct); // mark tees with data
	screen_goto_prev(navbar.hidden);
	}
#endregion
	
if androidBack 
	{
	activeStruct = struct_undo_pop(workingStruct,course_struct);
	screen_goto_prev(navbar.hidden);
	}


}
