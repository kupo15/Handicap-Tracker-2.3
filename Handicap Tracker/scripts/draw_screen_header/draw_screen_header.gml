
function draw_screen_header(header_string,height){

var xx = room_width*0.5;
var yy = 50;
var ww = 540;
var hh = 100;
var col = c_white;

if header_string != ""
	{
	draw_rectangle_color(0,0,ww,hh,col,col,col,col,false);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_height(xx,yy,header_string,height);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	}

// draw the 3 bars
draw_menu_bars(20,35,40,4,7,c_black);

// clicked on bars
if (submenu < 0 && screen_index != screen.score_card) && !mode_delete
if click_region_released(0,0,100,100,true,submenu) // make_color_rgb(0,255,255)
	{
	submenu_previous = submenu;
	submenu = navbar.sidebar;
	
	submenu_menu_xpos = 0;
	screen_darken_value = darken_index.sidebar;
	}
	
draw_header_delete(0,0,ww,hh);
}


function draw_header_delete(xx,yy,ww,hh){
draw_set_alpha(header_delete_offset_disp);

var col = c_gray;
draw_rectangle_color(0,0,ww,hh,col,col,col,col,false);

draw_menu_xout(xx+32,yy+35,35,35,5,c_white); // draw xout

if mode_delete && click_region_released(0,0,hh,hh,c_yellow,navbar.main)
mode_delete = false;


var height = 50;
var count = 0;
var size = ds_list_size(delete_list);

for(var i=0;i<size;i++)
count += delete_list[| i];

draw_set_color(c_white);
draw_text_height(xx+120,yy+35,string(count)+" selected",height); // draw number of items to delete

// clicked on trash
draw_sprite_ext(ico_trash2,0,xx+450,yy+20,0.7,0.7,0,c_white,header_delete_offset_disp); // trash icon
if mode_delete && click_region_released(room_width-125,0,125,hh,c_yellow,navbar.main)
delete_list_delete(delete_list,mode_delete_list_id);

draw_set_color(c_black);
draw_set_alpha(1);
}







