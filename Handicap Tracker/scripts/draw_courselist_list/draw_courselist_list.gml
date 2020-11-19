/*function draw_courselist_list() {
	
var alph = (coursebar_yoff_start/1);
draw_set_alpha(alph);

var rows = 13.7;
var sep = 65;
var ww = app_width;
var hh = rows*sep;
var xx = 0;
var yy = room_height+sep-((hh+sep)*coursebar_yoff_start);
var height = 40;

//if clickout_region(xx,yy,ww,hh,true,0)
//androidBack = true;

var col = make_colour_rgb(220,220,255);

draw_set_halign(fa_left);
draw_roundrect_colour(-1,yy,xx+ww,yy+hh,col,col,false);
draw_roundrect(-1,yy,xx+ww,yy+hh,true);

if searched_name != ""
draw_search_list(xx,yy,ww,sep,rows,height);
else
	{
	var list_size = array_length(courselist_array);
	var pos_start = floor(course_list_offset);
	var pos_end = min(list_size,ceil(course_list_offset)+rows);
	for(var i=pos_start;i<pos_end;i++)
		{
		var course_pointer = courselist_array[i];
		var course_name = course_pointer.courseName; // course name
		var off_pos = i-course_list_offset;
			
		// set highlight ypos and height
		if click_region(xx,yy+(off_pos*sep),ww,sep,noone,noone)
		click_highlight_set_clamped(yy,off_pos,sep,hh);
    
		draw_text_height(xx+30,yy+10+(off_pos*sep),course_name,height); // draw course name

		// clicked on course
		if click_region_released_clamp(xx,yy,(off_pos*sep),ww,sep,hh,mb_left,c_yellow,navbar.coursebar) 
		scr_coursebar_select(i,course_name);
		}
	
#region scrolling
var offset_start_pointer = [self,"course_list_offset_start"];
var offset_pointer = [self,"course_list_offset"];
var scrollbar_index = 0;
var xx = 0;
var sub = navbar.coursebar;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion
	}

// type in search bar
if kvActive
switch textboxIndex
	{
	case -1: searched_name = string_capitalize(keyboard_string,22); break; // scr_input_text(22); break;
	}
	
scr_searchbar_array(courselist_array);

// draw search bar
var col = make_color_rgb(230,230,230);
draw_rectangle_color(xx,yy-sep,xx+ww,yy,col,col,col,col,false);

// clicked on search bar
if click_region_released(xx,yy-sep,ww-sep-10,sep,true,submenu)
	{
	searching = true;
	click_textbox_set(searched_name,-1,kbv_type_default,kbv_returnkey_done);
	}

// clear
var xWidth = 25;
draw_menu_xout(room_width-sep+18,yy-sep+20,xWidth,xWidth,4,c_black);
if click_region_released(room_width-sep,yy-sep,sep,sep,true,submenu)
keyboard_string = "";

if searching // searched_name == ""
draw_text_height_ext_cursor(xx+65,yy+15-sep,searched_name,searched_name,0,-1,ww-sep-10,height,-1); // draw searched name
// draw_text_height_entry(xx+65,yy+15-sep,searched_name,height,noone,-1,height); // draw searched name
else
draw_text_height_entry(xx+65,yy+15-sep,"search course",height,noone,-1,height,fn_italic); // draw course label

draw_sprite_ext(ico_search,0,xx+15,yy-sep+15,0.35,0.35,0,c_white,1); // searchbar ico

draw_set_alpha(1);
}
