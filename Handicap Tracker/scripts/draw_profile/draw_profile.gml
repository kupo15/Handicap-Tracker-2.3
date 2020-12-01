function draw_profile() {
	
draw_screen_header(headerType.back,headerType.none,"Edit Profile");

var xx = 60;
var yy = 300;
var sep = 110;

var disp_name = activeStruct.dispName;

draw_text_height(xx,yy,"Name",25);
draw_text_height(xx,yy+25,disp_name,40);
draw_icon_width(ico_edit,0,app_width-60,yy+25,30,1); // edit icon
draw_line_pixel(100,yy+sep,app_width-100,1,c_lt_gray,1);

if click_region_released(0,yy,app_width,sep,true,navbar.hidden,1)
	{
	click_textbox_set(disp_name,textboxEntry.popupEntryText,kbv_type_default);
	submenu = navbar.popupEntry;
	}
	
var name_entry = draw_overlay_popup_entry("Enter your name",activeStruct.dispName,-1);

if name_entry != undefined
	{
	activeStruct.dispName = name_entry;
	PROFILE_data.dispName = name_entry;
	
	app_save;
	}

if androidBack
&& !kvActive
screen_change(screen.home,navbar.main,true);
}