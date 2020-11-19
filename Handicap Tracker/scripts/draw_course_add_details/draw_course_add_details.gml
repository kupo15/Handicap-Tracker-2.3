
/*
function draw_course_details() {

if textboxIndex <= 0
exit;

	
// Clear Teebox
var ww = 180;
var hh = 95;
var xx = 1;
var yy = room_height-hh-2;
var col = c_white;

// draw Clear Button
draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
draw_roundrect(xx,yy,xx+ww,yy+hh,true);
		
draw_set_halign(fa_center);
draw_text_height(xx+(ww/2),yy+20,"Clear",70);

// clear tee data
if click_region_released(0,yy,ww,hh,true,navbar.hidden)
	{	
	temp_course_yardage = "";
	temp_course_slope = "";
	temp_course_rating = "";
	temp_course_par = "";
			
	scr_tee_filled_set(true); // update tee filled data
	}
	
	
	
}


