function draw_sidebar_main_menu() {

#region draw menu
/*
var col = c_black;
draw_set_alpha(screen_darken_alpha*0.5);	
draw_rectangle_color(0,0,room_width,room_height,col,col,col,col,false); // darken background
draw_set_alpha(1);*/

var new_submenu = false;
var xx_off = submenu_menu_xpos_disp;
var xx = 0;
var yy = 0;
var ww = side_menu_width;
var hh = room_height;
var col = c_white;

draw_rectangle_color(xx+xx_off,yy,xx+xx_off+ww,yy+hh,col,col,col,col,false); // menu background

// if click outside of menu
if click_region_released(xx+xx_off+side_menu_width,yy,ww,hh,noone,navbar.sidebar) // make_color_rgb(0,255,255)
android_back_sidebar = true;

var yy_sep = 180;
draw_line(xx+xx_off,yy_sep,xx+xx_off+ww,yy_sep); // separating line

/*
var xx = 95;
var yy = 55;
var ww_hh = sprite_get_width(spr_icon_blank_profile);
draw_sprite(spr_icon_blank_profile,0,xx+xx_off,yy); // profile picture

if scr_mouse_position_room_released(xx+xx_off,yy,ww_hh,ww_hh,mb_left,noone,navbar.sidebar) // clicked on PROFILE PIC
funct_screen_set(screen.user_profile); // goto to profile

var xx = 140;
var yy = 155;
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_height(xx+xx_off,yy,user_disp_name,0,30,true); // draw user name
draw_text_height(xx+xx_off,yy+25,"@"+user_username,0,25,true); // draw user id*/


// draw menu items
var xx = 55;
var yy = yy_sep;
var yoff = 10;
var sep = 60;
var height = 40;

draw_set_halign(fa_left);
draw_text_height(xx+xx_off,yy+yoff+(0*sep),"Home",height);
draw_text_height(xx+xx_off,yy+yoff+(1*sep),"Course Stats",height);
draw_text_height(xx+xx_off,yy+yoff+(2*sep),"Playing Round",height);
draw_text_height(xx+xx_off,yy+yoff+(3*sep),"Score History",height);
draw_text_height(xx+xx_off,yy+yoff+(4*sep),"Courses",height);
draw_text_height(xx+xx_off,yy+yoff+(5*sep),"My Card",height);
draw_text_height(xx+xx_off,yy+yoff+(6*sep),"Handicap Trends",height);

draw_text_height(xx+xx_off,yy+yoff+(10*sep),"Help and Info",height);
draw_text_height(xx+xx_off,yy+yoff+(11*sep),"Settings",height);

draw_text_height(xx_off+15,room_height-40,"Vers. "+string(GM_version),30);


for(var i=0;i<12;i++)
	{
	if i>6 && i<10
	continue;
		
	draw_sprite_ext(spr_footer_icon,i,res_bleed_xx+xx_off,yy+9+(i*sep),0.12,0.12,0,c_white,1); // draw menu icons
	
	if i==10
	draw_line(xx_off,yy+(i*sep),xx_off+ww,yy+(i*sep)); // separating line

	if click_region_released(xx_off,yy+(i*sep),ww,sep,true,navbar.sidebar) // make_color_rgb(0,255,255)
		{
		submenu = navbar.main;
		android_back_sidebar = true;

		if i<5
			{
			scr_navbar_click(i);
			new_submenu = true;
			}
		else
		switch i
			{
			case 5: screenIndex = screen.score_card; 
					submenu = navbar.hidden;
					break;
			
			case 6: scr_trend_set(); break;
			
			case 10: screenIndex = screen.help_info; break;
			
			case 11: break;
			}
		}
	}

#endregion


	if android_back_sidebar
		{
		// submenu_menu_xpos = 1;
		submenu_menu_xpos = -side_menu_width-30;
	
		if !new_submenu && submenu == navbar.sidebar
		submenu = submenu_previous;
		}


}
