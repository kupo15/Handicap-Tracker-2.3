function draw_nav_bar() {

	var alph = 1-(navbar_yoff_start/1);

	draw_set_alpha(alph);
	var sca_off = nav_sca_off;
	var ico_num = nav_ico_num;
	var ww = 540;
	var hh = nav_height*sca_off;
	var xx_nav = 0;
	var yy_nav = 960-hh+(hh*navbar_yoff_start);
	var col = make_colour_rgb(2,121,172);

	draw_rectangle_colour(xx_nav,yy_nav,xx_nav+ww,yy_nav+hh,col,col,col,col,false);

	var sca = 0.3*sca_off;
	var ic_hh = sprite_get_height(spr_footer_icon)*sca;
	var hh_diff = hh-ic_hh;
	var yoff = hh_diff*0.5;

	var xoff = 540/ico_num;
	var ww_diff = xoff-ic_hh;

	// add home
	var xx = ww_diff*0.5;
	var yy = room_height-hh+yoff+(hh*navbar_yoff_start);

	// draw icons
	draw_sprite_ext(spr_home,0,xx+(0*xoff),yy-10,sca,sca,0,c_white,alph);
	draw_sprite_ext(spr_stat,0,xx+(1*xoff),yy-10,sca,sca,0,c_white,alph);
	draw_sprite_ext(spr_play,0,xx+(2*xoff),yy-10,sca,sca,0,c_white,alph);
	draw_sprite_ext(spr_score_add,0,xx+(3*xoff),yy-10,sca,sca,0,c_white,alph);
	draw_sprite_ext(spr_course_add,0,xx+(4*xoff),yy-10,sca,sca,0,c_white,alph);

	var height = 25;
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_height(0.5*xoff,yy+hh-40,"Home",height);
	draw_text_height(1.5*xoff,yy+hh-40,"Stats",height);
	draw_text_height(2.5*xoff,yy+hh-40,"Playing",height);
	draw_text_height(3.5*xoff,yy+hh-40,"Scores",height);
	draw_text_height(4.5*xoff,yy+hh-40,"Courses",height);
	draw_set_color(c_black);

	for(var i=0;i<ico_num;i++)
	if click_region_released(i*xoff,yy_nav,xoff,hh,true,submenu)
	scr_navbar_click(i);

	// draw highlight
	var xx = xoff*screen_index;
	var yy = 959-hh+(hh*navbar_yoff_start);

	var col = c_white;

	draw_set_alpha(0.5);
	draw_roundrect_colour(xx,yy,xx+xoff,yy+hh,col,col,false);
	draw_set_alpha(1);



}
