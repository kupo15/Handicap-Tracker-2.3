function sidebar_fades() {
	
	// navbar
	navbar_yoff = (submenu != navbar.main); // ? navbar_yoff = false : navbar_yoff = true

	if navbar_yoff != navbar_yoff_start
	navbar_yoff_start = lerp(navbar_yoff_start,navbar_yoff,0.19);

	// teebar
	teebar_yoff = (submenu == navbar.teebar); // ? teebar_yoff = true : teebar_yoff = false

	if teebar_yoff != teebar_yoff_start
	teebar_yoff_start = lerp(teebar_yoff_start,teebar_yoff,0.19);

	// parbar
	parbar_yoff = (submenu == navbar.parbar); // ? parbar_yoff = true : parbar_yoff = false

	if parbar_yoff != parbar_yoff_start
	parbar_yoff_start = lerp(parbar_yoff_start,parbar_yoff,0.19);

	// scorebar
	scorebar_yoff = (submenu == navbar.scorebar); // ?	scorebar_yoff = true : scorebar_yoff = false

	if scorebar_yoff != scorebar_yoff_start
	scorebar_yoff_start = lerp(scorebar_yoff_start,scorebar_yoff,0.19);

	// coursebar
	coursebar_yoff = (submenu == navbar.coursebar); // ? coursebar_yoff = true : coursebar_yoff = false

	if coursebar_yoff != coursebar_yoff_start
	coursebar_yoff_start = lerp(coursebar_yoff_start,coursebar_yoff,0.19);

	// alpha
	if alpha_lerp != alpha_lerp_end
	alpha_lerp = lerp(alpha_lerp,alpha_lerp_end,0.19);

	// lerp the side menu position
	var lerp_spd = 0.13;

	if submenu_menu_xpos != submenu_menu_xpos_disp
	submenu_menu_xpos_disp = lerp(submenu_menu_xpos_disp,submenu_menu_xpos,lerp_spd);

	// lerp the darken screen behind it
	screen_darken_alpha = 1-(abs(submenu_menu_xpos_disp)/side_menu_width);
	
	/*switch screen_darken_value
		{
		case darkenIndex.none: screen_darken_alpha = 2; break;
		case darkenIndex.sidebar: screen_darken_alpha = 1-(abs(submenu_menu_xpos_disp)/side_menu_width); break;
		}*/
		
	// header delete
	headerDeleteOffset = mode_delete;

	if headerDeleteOffset != headerDeleteOffsetDisp
	headerDeleteOffsetDisp = lerp(headerDeleteOffsetDisp,headerDeleteOffset,0.19);
	
}
