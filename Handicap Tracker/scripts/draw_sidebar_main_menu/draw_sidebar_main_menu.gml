function draw_sidebar_main_menu() {

#region draw menu
var offset = 1-offsetArray[offsetScroll.sidebarXoff];
var new_submenu = false;
var xx_off =  offset*(-side_menu_width-30);
var xx = 0;
var yy = 0;
var ww = side_menu_width;
var hh = room_height;
var col = c_white;

draw_rectangle_color(xx+xx_off,yy,xx+xx_off+ww,yy+hh,col,col,col,col,false); // menu background

// if click outside of menu
if click_region_released(xx+xx_off+side_menu_width,yy,ww,hh,noone,navbar.sidebar) // make_color_rgb(0,255,255)
androidBackSidebar = true;

var yy_sep = 180;
draw_line(xx+xx_off,yy_sep,xx+xx_off+ww,yy_sep); // separating line


var xx = side_menu_width*0.5;
var yy = 15;
draw_icon_height(spr_icon_blank_profile,xx+xx_off,yy,120,1); // profile picture

//if scr_mouse_position_room_released(xx+xx_off,yy,ww_hh,ww_hh,mb_left,noone,navbar.sidebar) // clicked on PROFILE PIC
//funct_screen_set(screen.user_profile); // goto to profile

var yy = 150;
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_height(xx+xx_off,yy,user_disp_name,30,true); // draw user name
//draw_text_height(xx+xx_off,yy+25,"@"+user_username,25,true); // draw user id

// draw menu items
var xx = 100;
var yy = yy_sep;
var sep = 70;
var height = 30;

draw_set_halign(fa_left);
draw_set_color(c_black);
draw_text_height_middled(xx+xx_off,yy+(screen.home*sep),"Home",sep,height);
draw_text_height_middled(xx+xx_off,yy+(screen.stats*sep),"Course Stats",sep,height);
draw_text_height_middled(xx+xx_off,yy+(screen.playing*sep),"Active Round",sep,height);
draw_text_height_middled(xx+xx_off,yy+(screen.score_list*sep),"Score History",sep,height);
draw_text_height_middled(xx+xx_off,yy+(screen.course_list*sep),"Courses",sep,height);
draw_text_height_middled(xx+xx_off,yy+(screen.score_card*sep),"My Card",sep,height);
draw_text_height_middled(xx+xx_off,yy+(screen.indexTrend*sep),"Handicap Trends",sep,height);
draw_text_height_middled(xx+xx_off,yy+(screen.handicapSeason*sep),"Handicap Season",sep,height);

draw_text_height_middled(xx+xx_off,yy+(screen.help_info*sep),"Help and Info",sep,height);
draw_text_height_middled(xx+xx_off,yy+(screen.settings*sep),"Settings",sep,height);

draw_text_height(xx_off+15,room_height-40,"Vers. "+string(GM_version),30);

for(var i=0;i<screen.enumcount;i++)
	{
	if (i>screen.handicapSeason) && (i<screen.help_info)
	continue;
		
	draw_icon_height_centered_color(spr_footer_icon,i,res_bleed_xx+xx_off,yy+(i*sep),sep*0.7,sep,sep*0.7,header_color,1); // draw menu icons
	
	if i == screen.help_info
	draw_line(xx_off,yy+(i*sep),xx_off+ww,yy+(i*sep)); // separating line

	if click_region_released_clamp(xx_off,yy,(i*sep),ww,sep,screen.enumcount*sep,mb_left,true,navbar.sidebar,i,undefined,navbar.sidebar)
		{
		click_highlight_alpha = 0;
		click_highlight_alpha_start = 0;
		
		submenu = navbar.main;
		androidBackSidebar = true;

		scr_navbar_click(i);
		new_submenu = true;
		}
	}

#endregion


	if androidBackSidebar
		{	
		if !new_submenu && (submenu == navbar.sidebar)
		submenu = submenuPrevious;
		}


}
