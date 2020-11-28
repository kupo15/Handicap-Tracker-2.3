function draw_sidebar_main_menu() {
	
draw_set_halign(fa_left);
draw_set_color(c_black);

var offset = 1-offsetArray[offsetScroll.sidebarXoff];
var new_submenu = false;
var xx_off =  offset*(-side_menu_width-30);
var xx = 0;
var yy = 0;
var ww = side_menu_width;
var hh = app_height;
var profile_hh = 220;
var col = c_white;
var profile_col = make_color_rgb(76,102,145);

#region profile section
draw_rectangle_color(xx+xx_off,yy,xx+xx_off+ww,yy+hh,col,col,col,col,false); // menu background

// if click outside of menu
if click_region_released(xx+xx_off+ww,yy,ww,hh,noone,navbar.sidebar) // make_color_rgb(0,255,255)
androidBackSidebar = true;
else if click_button(xx_off,yy,"",0,c_black,ww,profile_hh,profile_col,false,false,navbar.sidebar)
submenu = navbar.profileChange;

var xx = 25;
var yy = 25;

draw_icon_height(spr_icon_blank_profile,xx+xx_off,yy,100,1); // profile picture

var height = 30;
var yy = profile_hh-height-10;

draw_text_height_color(xx+xx_off,yy,user_disp_name,c_white,height,fn_bold); // draw user name
//draw_text_height(xx+xx_off,yy+25,"@"+user_username,25); // draw user id

#endregion

var xx = 100;
var yy = profile_hh;
var sep = 70;
var height = 30;
#region draw menu items
draw_set_halign(fa_left);
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

draw_sidebar_profile_switch(xx_off,profile_hh);

if androidBackSidebar
	{	
	if !new_submenu && (submenu == navbar.sidebar)
	submenu = submenuPrevious;
	}
}

function draw_sidebar_profile_switch(xx_off,yy) {
	
if submenu != navbar.profileChange
exit;

var xx = 0+xx_off;
var ww = side_menu_width;
var col = c_white;

draw_rectangle_color(xx,yy,xx+ww,app_height-70,col,col,col,col,false);
	
var xoff = 30;
var text_xoff = 110;
var height = 30;
var sep = 70;

var size = array_length(ROOT_data_struct.profiles)+1;
for(var i=0;i<size;i++)
	{
	var off_pos = i*sep;
	
	if (i+1 == size) // last index
		{
		draw_plus_button(xoff,yy+off_pos+(sep*0.5),50,false);
		draw_text_height_middled(xx+text_xoff,yy+off_pos,"Add User",sep,height,1);
		
		if click_region(xx,yy+off_pos,ww,sep,true,mb_left,navbar.profileChange)
		scr_profile_create("Megan");
		
		break;	
		}
		
	var profile_pointer = ROOT_data_struct.profiles[i];
	var disp_name = profile_pointer.dispName;
	var handicap_index = string_format(profile_pointer.index,1,1);
		
	draw_icon_height(spr_icon_blank_profile,xx+25,yy+((sep-(sep*0.8))*0.5)+off_pos,sep*0.8,1); // profile picture
	draw_text_height_middled(xx+text_xoff,yy+off_pos,disp_name,sep,height,1); // profile name
	draw_text_height_middled(xx+text_xoff+200,yy+off_pos,handicap_index,sep,height,1); // index
		
	draw_line_pixel(xx+text_xoff,yy+off_pos+sep,ww-text_xoff,1,c_lt_gray,1);	
		
	if click_region(xx,yy+off_pos,ww,sep,true,mb_left,navbar.profileChange)
		{
		scr_profile_set(i);
		scr_handicap_calculate();
		submenu = navbar.sidebar;
		}
	}
	
if androidBack
	{
	submenu = navbar.sidebar;
	androidBack = false;
	androidBackSidebar = false;
	}
}