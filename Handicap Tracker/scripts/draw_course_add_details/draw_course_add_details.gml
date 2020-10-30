function draw_course_details() {

if textbox_index <= 0
exit;

	
// Clear Teebox
var ww = 180;
var hh = 95;
var xx = 1;
var yy = room_height-hh-2;
var col = c_white;

// draw Clear Button
draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
draw_roundrect(xx,yy,xx+ww,yy+hh,true);
		
draw_set_halign(fa_center);
draw_text_height(xx+(ww/2),yy+20,"Clear",70);

// clear tee data
if click_region_released(0,yy,ww,hh,true,navbar.hidden)
	{	
	temp_course_yardage = "";
	temp_course_slope = "";
	temp_course_rating = "";
	temp_course_par = "";
			
	scr_tee_filled_set(true); // update tee filled data
	}
	
	
	
}



#region old code
/* function draw_course_add_details() {

	// header
	var str = "Edit Course";
	if screen_index == screen.add_course
	str = "Create Course";

	draw_screen_header(str,60);

	// delete course
	if screen_index == screen.edit_course
		{
		var xx = 440;
		var yy = 30;
		var rr = 80;
	
		draw_sprite(ico_trash,0,xx,yy); // draw trash icon
	
		// clicked trash icon
		if click_region_released(xx,yy,rr,rr,true,navbar.hidden)
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
		
			scr_handicap_calculate();
			json_save(save_data);
		
			submenu = navbar.main;
	        textbox_index = noone;
	        screen_index = screen.course_list;
	        index = 0;
			exit;
			}
		}

	var xx = 20;
	var yy = 120;
	var sep = 130;
	var height = 70;

	var tee_pointer = course_id[| 1]; // teebox MAP
	var tee_color = teebox_list[| teebox_index]; // color
	var tee_data_pointer = tee_pointer[? tee_color];

	if kv_active
	switch textbox_index
	    {
	    case course_data.name: course_id[| 0] = scr_input_text(26); break;
	
	    case course_data.yardage: if teebox_index != noone
								  tee_data_pointer[| 0] = scr_input_text(4); 
								  break;
							  
	    case course_data.slope: if teebox_index != noone
								tee_data_pointer[| 1] = scr_input_text(3); 
								break;
							  
	    case course_data.rating: if teebox_index != noone
								 tee_data_pointer[| 2] = scr_input_text(4); 
								 break;
	    }

	var course_name = course_id[| 0];

	if teebox_index = noone
		{
		var course_tee = "";
		var course_yardage = "";
		var course_slope = "";
		var course_rating = "";
		}
	else // teebox selected
		{
		var course_tee = teebox_list[| teebox_index]; // teebox color

		var tee_pointer_MAP = course_id[| 1];
		var tee_color = teebox_list[| teebox_index];
		var tee_data_pointer = tee_pointer_MAP[? tee_color];
		var course_yardage = tee_data_pointer[| 0];
		var course_slope = tee_data_pointer[| 1];
		var course_rating = tee_data_pointer[| 2];
		}


	if textbox_index >= 2
	yy -= sep*2;
	else
		{
		var course_height = text_reduce(course_name,500,height);
		draw_text_height(xx,yy,"Course",height*0.6,fn_italic); // draw course name label
	    draw_text_height_entry(xx,yy+40,course_name,course_height,noone,0,height); // draw course name

		draw_text_height(xx,yy+(1*sep),"Tee",height*0.6,fn_italic); // draw course tee markers label
		draw_text_height(xx,yy+40+(1*sep),course_tee,height); // draw course tee markers
		}

	draw_text_height(xx,yy+(2*sep),"Yardage",height*0.6,fn_italic); // draw course yardage label
	draw_text_height_entry(xx,yy+40+(2*sep),course_yardage,height,noone,2,height); // draw course yardage

	draw_text_height(xx,yy+(3*sep),"Slope",height*0.6,fn_italic); // draw course slope label
	draw_text_height(xx+110,yy+10+(3*sep),"(i.e. 124)",height*0.4,fn_italic); // draw course slope label
	draw_text_height_entry(xx,yy+40+(3*sep),course_slope,height,noone,3,height); // draw course slope

	draw_text_height(xx,yy+(4*sep),"Rating",height*0.6,fn_italic); // draw course slope label
	draw_text_height(xx+130,yy+10+(4*sep),"(i.e. 70.2)",height*0.4,fn_italic); // draw course slope label
	draw_text_height_entry(xx,yy+40+(4*sep),course_rating,height,noone,4,height); // draw course slope

	var ww = 540;
	var col = c_gray;

	if teebox_index == noone
		{
		draw_text_height(xx,yy+40+(2*sep),"-select tee-",height); // draw course yardage
		draw_text_height(xx,yy+40+(3*sep),"-select tee-",height); // draw course slope
		draw_text_height(xx,yy+40+(4*sep),"-select tee-",height); // draw course rating
	
		draw_set_alpha(0.5);
		draw_rectangle_color(0,yy+(2*sep),ww,yy+(5*sep),col,col,col,col,false);
		draw_set_alpha(1);
		}
	

	if virtual_keyboard_enter && textbox_index == 0
		{
		textbox_index = 1;
		submenu = 1;
		}

	var move = noone;

	if virtual_keyboard_enter && textbox_index > 1
		{
		move = textbox_index+1;
		if move == 5
			{
			move = noone;
			android_back = true;
			}
		}
	else
	for(var i=0;i<5;i++)
	if mouse_y > 120 && click_region_released(0,yy+(i*sep),ww,sep,true,navbar.hidden)
	move = i;


	if move != noone
	    {
		var i = move;
	    textbox_index = i;
	    submenu = navbar.hidden;
		        
		switch i
			{
			// course name
			case course_data.name: keyboard_string = course_id[| 0];
								   vk_initiate(kbv_type_default);
								   break;
			
			// tees
		    case course_data.tee: if kv_active
						          vk_hide();
								  else
								  submenu = course_data.tee; 
								  break;
				
			// yardage
			case course_data.yardage: if teebox_index != noone
										{
										keyboard_string = tee_data_pointer[| 0];
										vk_initiate(kbv_type_numbers); 
										}
									  break;
		
			// slope
			case course_data.slope: if teebox_index != noone
										{
										keyboard_string = tee_data_pointer[| 1];
										vk_initiate(kbv_type_numbers); 
										}
									break;
		
			// rating
			case course_data.rating: if teebox_index != noone
										{
										keyboard_string = tee_data_pointer[| 2];
										vk_initiate(kbv_type_numbers); 
										}
									break;
			}
	    }

	// Create
	if screen_index == screen.add_course
		{
		var submit = (course_id[| 0] != "");
		var yy = 770;
		var ww = 540;
		var hh = sep;

		draw_set_alpha(0.5+(0.5*submit));
		draw_rectangle(-1,yy,ww,yy+hh,true);
		draw_set_halign(fa_center);
		draw_text_height(540/2,yy+20,"Create",100);
		draw_set_alpha(1);

		// if clicked Create
		if click_region_released(0,yy,ww,sep,true,navbar.hidden) && submit
			{
			submenu = navbar.main;
		    textbox_index = noone;
		    screen_index = screen.course_list;
		    index = 0;
			ds_list_sort_nested(master_course_list,0,true); // sort list
			json_save(save_data);
			}
		}

//	draw_teebox_list();   
	
	if android_back
	    {
		if textbox_index >= 2
		textbox_index = noone;
		else if submenu >= 0
	    submenu = navbar.hidden;
	    else if !kv_active
	        {
			// delete course unsaved
			if screen_index == screen.add_course
			ds_list_delete(master_course_list,index);
		
			scr_update_course_info(course_name);
			submenu = navbar.main;
	        textbox_index = noone;
	        screen_index = screen.course_list;
	        index = 0;
			ds_list_sort_nested(master_course_list,0,true);
			json_save(save_data);
	        }
		
		vk_hide();
	    }



}
*/
#endregion