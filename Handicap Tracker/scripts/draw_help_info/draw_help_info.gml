function draw_help_info() {

// draw the 3 bars
draw_screen_header(headerType.bars,headerType.none,"Help Info");

// draw Index Calculation
var xx = 20;
var yy = 130;

draw_text_height(xx,yy,"Exceptional Score Reduction",45);
draw_text_height_ext(xx,yy+40,"If you score seven (7) strokes or better than your handicap, the last 19 Scores gets reduced by one stroke. If better than 10 strokes, last 19 scores gets reduced by two (2) strokes"
,-1,500,0,30);

// draw Index Calculation
yy += 270;
var ysep = 40;

draw_text_height(xx,yy,"Handicap Index Calculation",45);
draw_text_height(xx,yy+10+(1*ysep),"Best 8 scores of the last 20 rounds",30);


// draw handicap calculation
yy += 120;

draw_text_height(xx,yy,"Course Handicap Calculation",45);

var xx = 0;
yy -= 40;
draw_set_halign(fa_center);
draw_text_height(xx+150,yy+100,"Index*Course Slope\n113",60);
draw_text_height(xx+400,yy+115,"+ (Course Rating-Par)\n ",60);
draw_line_pixel(xx+30,yy+130,240,1,c_black,1);


if multiTouch[3]
	{
	debug_data_reset();
	scr_handicap_calculate();
	app_save;
	}

}
