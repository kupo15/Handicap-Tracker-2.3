function draw_course_edit_tees() {

var bg_col = c_lt_gray;
draw_clear(bg_col);

// header
var str = "Edit Course";

if screenIndex == screen.add_course
str = "Create Course";

draw_screen_header(headerType.back,headerType.none,str);

#region textbox entry
if kvActive
switch textboxIndex
	{	
	case course_data.yardage: course_edit_yardage = string_convert_real(keyboard_string,4); break;
							  
	case course_data.slope: course_edit_slope = string_convert_real(keyboard_string,3); break;
							  
	case course_data.rating: course_edit_rating = string_convert_rating(keyboard_string,3); break;
							  
	case course_data.par: course_edit_par = string_convert_real(keyboard_string,2); break;
	}
#endregion

var course_tee = teebox_list[| tee_index];
var course_yardage = course_edit_yardage;
var course_slope = course_edit_slope;
var course_rating = course_edit_rating;
var course_par = course_edit_par;

// draw tee 
var xx = 10;
var yy = 120;
var sep = 120;
var height = 50;
var ww = app_width-xx-xx;
var hh = 90;
var col = c_white;

if draw_dialogue_box(xx,yy,ww,hh,col,navbar.hidden)
	{

	}
	
// draw tee details
draw_text_height(xx+20,yy+10,"Tee",25);
draw_text_height(xx+50,yy+25,course_tee+" Tee",height); // draw course tee markers

var col = 280;
var alph = 	0.5+((teebox_index != noone)*0.5);
draw_set_alpha(alph);
draw_textbox(0,yy+40+(1*sep),room_width,80);
draw_text_height(xx,yy+(1*sep),"Yardage",height*0.6,fn_italic); // draw course yardage label
draw_text_height_ext_cursor(xx,yy+40+(1*sep),course_yardage,course_yardage,0,-1,room_width,height,2); // draw course yardage

draw_text_height(xx,yy+(2*sep),"Slope",height*0.6,fn_italic); // draw course slope label
draw_textbox(0,yy+40+(2*sep),250,80);
draw_text_height(xx+110,yy+10+(2*sep),"(i.e. 124)",height*0.4,fn_italic); // draw course slope label
draw_text_height_ext_cursor(xx,yy+40+(2*sep),course_slope,course_slope,0,-1,room_width,height,3); // draw course slope

draw_textbox(col,yy+40+(2*sep),250,80);
draw_text_height(xx+(1*col),yy+(2*sep),"Rating",height*0.6,fn_italic); // draw course slope label
draw_text_height(xx+130+(1*col),yy+10+(2*sep),"(i.e. 70.2)",height*0.4,fn_italic); // draw course slope label
draw_text_height_ext_cursor(xx+(1*col),yy+40+(2*sep),course_rating,course_rating,0,-1,room_width,height,4); // draw course slope
	
draw_textbox(0,yy+40+(3*sep),room_width,80);
draw_text_height(xx+(0*col),yy+(3*sep),"Par",height*0.6,fn_italic); // draw course slope label
draw_text_height_ext_cursor(xx+(0*col),yy+40+(3*sep),course_par,course_par,0,-1,room_width,height,5); // draw course par
draw_set_alpha(1);
	
draw_course_details();

#region navigation

var move = noone;
if virtual_keyboard_enter 
	{
	move = textboxIndex+1; // move to next textbox
		
	if move == 6 // end of textboxes
		{
		move = noone;
		vk_hide();
		}
	}
else
	{
	var col = 280;
		
	// if click_region_released(0,yy+(0*sep),ww,sep,true,navbar.hidden)
	// move = course_data.tee;
		
	var ww = app_width;
	if click_region_released(0*col,yy+(1*sep),ww,sep,true,navbar.hidden)
	move = course_data.yardage;
		
	var ww = 280;
	if click_region_released(0*col,yy+(2*sep),ww,sep,true,navbar.hidden)
	move = course_data.slope;
		
	if click_region_released(1*col,yy+(2*sep),ww,sep,true,navbar.hidden)
	move = course_data.rating;
		
	var ww = app_width;
	if click_region_released(0*col,yy+(3*sep),ww,sep,true,navbar.hidden)
	move = course_data.par;
	}

// if clicked or pressed enter
if move != noone
	{
	var i = move;
	textboxIndex = i;
	submenu = navbar.hidden;
		        
	switch i
		{
		// course name
		case course_data.name: click_textbox_set(course_edit_name,i,kbv_type_default); break;
			
		// tees
		case course_data.tee: if kvActive
						        vk_hide();
								else
								submenu = navbar.teebar; 
								break;
				
		// yardage
		case course_data.yardage: if tee_data_pointer != undefined && teebox_index != noone
									click_textbox_set(temp_course_yardage,i,kbv_type_numbers);
									break;
		
		// slope
		case course_data.slope: if teebox_index != noone
								click_textbox_set(temp_course_slope,i,kbv_type_numbers);
								break;
		
		// rating
		case course_data.rating: if teebox_index != noone
									click_textbox_set(temp_course_rating,i,kbv_type_numbers);
									break;
		
		// par
		case course_data.par: // submenu = navbar.parbar; 
		
		 						if teebox_index != noone
								click_textbox_set(temp_course_par,i,kbv_type_numbers);								  
								break;
		}
	}
#endregion


// delete course
if screenIndex == screen.edit_course && textboxIndex <= 0
	{
	var ww = 170;
	var hh = 95;
	var xx = 5;
	var yy = room_height-hh-2;
	var col = c_red;
	
	draw_set_alpha(0.3);
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
	draw_set_alpha(1);

	draw_sprite_ext(ico_trash2,1,xx+55,yy+10,0.8,0.8,0,c_white,1); // draw trash icon
	
	// clicked trash icon
	if click_region_released(xx,yy,ww,hh,true,navbar.hidden)
		{
		ds_list_delete(master_course_list,index);
		
		if course_id[| 0] == play_course_name
			{
			play_course_id = noone;
			play_course_index = noone;
			play_course_name = "";
			play_course_teebox = noone;
			play_course_teebox_index = noone;
			play_course_yardage = noone;
			play_course_slope = noone;
			play_course_rating = noone;
			play_course_par = noone;
			play_course_handicap_inc = noone;
			play_course_handicap_dec = noone;
			}
			
		app_save;

		submenu = navbar.main;
	    textboxIndex = noone;
	    screenIndex = screen.course_list;
	    index = 0;
		exit;
		}
	}

	// Create
	var submit = ((course_edit_name != "") && (textboxIndex <= 0)) 
	|| ((textboxIndex > 0) && ((temp_course_yardage != "") && (temp_course_slope != "") && (temp_course_rating != "") && (temp_course_par != ""))
	|| (temp_course_yardage == "") && (temp_course_slope == "") && (temp_course_rating == "") && (temp_course_par == ""));
	
	var ww = 350;
	var hh = 95;
	var xx = 185;
	var yy = room_height-hh-2;
	
	switch textboxIndex
		{
		case -1:
		case 0:	var str = "Save"; 
				break;
		
		default: var str = "Done"; 
		
				 if screenIndex == screen.edit_course
				 var str = "Done";
				 break;
		}

	// draw Create/Next box
	draw_set_alpha(0.5+(0.5*submit));
	draw_roundrect(xx,yy,xx+ww,yy+hh,true);
	
	draw_set_halign(fa_center);
	draw_text_height(xx+(ww/2),yy+20,str,70);
	draw_set_alpha(1);

	// if clicked Next or Create/Update
	if click_region_released(xx,yy,ww,sep,true,navbar.hidden) && submit
		{
		if textboxIndex <= 0
			{ // course name screen			
			var tee_size = ds_list_size(teebox_list);
			for(var i=0;i<tee_size;i++)
				{
				var tee_pointer_MAP = course_id[| 1];
				var tee_color = teebox_list[| i];
				var tee_data_pointer = tee_pointer_MAP[? tee_color];
				
				// save course data
				tee_data_pointer[| tee_data.yardage] = temp_tee_data[i][| tee_data.yardage];
				tee_data_pointer[| tee_data.slope] = temp_tee_data[i][|tee_data.slope];
				tee_data_pointer[| tee_data.rating] = temp_tee_data[i][| tee_data.rating];
				tee_data_pointer[| tee_data.par] = temp_tee_data[i][| tee_data.par];	
				}
			
			scr_update_course_info(course_id[| course_data.name]);
			screenIndex = screen.course_list;
			submenu = navbar.main;
			ds_list_sort_nested(master_course_list,0,true); // sort list
			app_save;
			}
		else
			{ // Update Tee Data
			if string_length(temp_course_rating) == 3
			temp_course_rating += "0";
							
			// set temp tee data
			temp_tee_data[teebox_index][| tee_data.yardage] = temp_course_yardage;
			temp_tee_data[teebox_index][| tee_data.slope] = temp_course_slope;
			temp_tee_data[teebox_index][| tee_data.rating] = temp_course_rating;
			temp_tee_data[teebox_index][| tee_data.par] = temp_course_par;		
			scr_tee_filled_set(true); // update tee filled data

			if prev_screen == noone	
				{
				textboxIndex = noone;
				}
			else
				{// coming from teebar
				screen_goto_prev(navbar.teebar); // go back to prev screen
				textboxIndex = noone;
				index = 0;
				}
			}
		}

	
	if androidBack
	    {
		if kvActive
			{
			if textboxIndex >= 2
			vk_hide();
			}
		else if submenu >= 0
		submenu = navbar.hidden;
	    else 
	        {
			// if coming from another screen
			if prev_screen != noone
				{
				screen_goto_prev(navbar.teebar);
				exit;
				}
		
			// if in details screen
			if textboxIndex > 0
				{
				textboxIndex = 0;
				
				/*if (temp_course_yardage == "") && (temp_course_slope == "") && (temp_course_rating == "") && (temp_course_par == "")
					{// set temp tee data
					temp_tee_data[teebox_index][| tee_data.yardage] = temp_course_yardage;
					temp_tee_data[teebox_index][| tee_data.slope] = temp_course_slope;
					temp_tee_data[teebox_index][| tee_data.rating] = temp_course_rating;
					temp_tee_data[teebox_index][| tee_data.par] = temp_course_par;		
					scr_tee_filled_set(true); // update tee filled data
					}*/
				}
			else
			textboxIndex --;
		
			if textboxIndex < 0
				{
				// delete course unsaved
				if screenIndex == screen.add_course
				ds_list_delete(master_course_list,index);
		
				// from course edit
				submenu = navbar.main;
		        textboxIndex = noone;
		        screenIndex = screen.course_list;
		        index = 0;
				ds_list_sort_nested(master_course_list,0,true);
				app_save;
				}
	        }
	    }



}
