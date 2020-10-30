function draw_year_select() {

	var col = c_black;

	draw_set_alpha(alpha_lerp*0.6);
	draw_rectangle_color(0,0,room_width,room_height,col,col,col,col,false);
	draw_set_alpha(1);

	var xx = 0;
	var ww = room_width;
	var hh = 400;
	var yy = room_height-(alpha_lerp*(hh+30));
	var col = c_white; 
	var year_sel_parse = 1970+floor(year_select_offset/12);


	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false); // draw dialogue

	draw_text_height(room_width*0.5,yy+20,year_sel_parse,50); // draw year

	draw_text_height(xx+30,yy+20,"<",50); // draw left arrow
	if click_region_released(xx+15,yy+20,50,50,true,submenu)
		{
		year_select_offset -= 12;
	
		if year_select_offset < 0
		year_select_offset = 0;
		}

	draw_text_height(xx+ww-50,yy+20,">",50); // draw right arrow
	if click_region_released(xx+ww-50-15,yy+20,50,50,true,submenu)
	year_select_offset += 12;

	var xsep = room_width*0.33;
	var ysep = (hh-100)*0.25;
	var xoff = (room_width/2)-xsep;

	for(var i=0;i<12;i++)
		{
		var col = make_color_rgb(220,220,220); // default
	
		if ((year_parse-1970)*12)+i == year_select_offset
		var col = make_color_rgb(255,255,193);
	
		draw_roundrect_color(xx+15+((i mod 3)*xsep),yy+80+(floor(i/3)*ysep),xx+15+xsep-25+((i mod 3)*xsep),yy+80+ysep-15+(floor(i/3)*ysep),col,col,false); // draw boxes
	
		var mon_disp = funct_convert_date(i,false,-1,-1);
		draw_text_height(xx+xoff+((i mod 3)*xsep),yy+90+(floor(i/3)*ysep),mon_disp,50); // draw month
	
		if click_region_released(xx+15+((i mod 3)*xsep),yy+80+(floor(i/3)*ysep),xsep-25,ysep-15,true,submenu)
			{
			month_offset_end = ((year_sel_parse-1970)*12)+i;
			android_back = true;
			}
		}

	if clickout_region(xx,yy,ww,hh,noone,navbar.year_select)
		{
		submenu = navbar.hidden;
		alpha_lerp_end = 0;
		android_back = false;
		}



}
