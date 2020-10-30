function draw_footer_button() {

	// footer button
	var xx = 375;
	var yy = 960-hh+25;
	draw_sprite_ext(spr_footer_icon,screen_index,xx,yy,0.5,0.5,0,c_white,1);

	if click_region_released(xx,yy,150,150,true,submenu)
	screen_index = screen.add_course;


	/*
	// draw highlight
	var xx = 15+(180*screen_index);

	var col = c_white;

	draw_set_alpha(0.5);
	draw_roundrect_colour(xx,yy,xx+150,yy+150,col,col,false);
	draw_set_alpha(1);


/* end draw_footer_button */
}
