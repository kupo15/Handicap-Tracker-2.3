function draw_score_details() {

#region header
var bg_col = c_lt_gray;
draw_clear(bg_col);

var str = pick("Add Score","Edit Score",screenIndex == screen.edit_score);
var trash_delete = draw_screen_header(headerType.back,headerType.trash,str);	

if trash_delete
	{
	array_delete(scorelist_array,score_index,1); // delete score
	score_index = 0;

	screen_goto_prev(navbar.main);
	app_save;
	exit;
	}
#endregion

if kvActive
switch textboxIndex
	{
	case score_data.score_: score_struct.roundScore = string_convert_real_numpad(numpad_value,3); break;
	case score_data.strokes: score_struct.roundStrokes = string_convert_real_numpad(numpad_value,2); break;
	}	

#region draw score/strokes
var xx = 0;
var yy = 300;
var ww = app_width-xx-xx;
var hh = 90;

draw_roundrect_color(xx,yy,xx+ww,yy+hh,c_white,c_white,false);
draw_line_pixel(ww*0.5,yy+10,1,hh-20,c_gray,1);

var height = 45;

// draw labels
draw_set_halign(fa_left);
draw_text_height(xx+20,yy+5,"Gross Score",label_height,fn_italic); // draw score label
draw_text_height(xx+20+(ww*0.5),yy+5,"Strokes Reduced",label_height,fn_italic); // draw score label

// draw values
draw_text_height_label(xx+70,yy+40,roundScore,"enter score",height);
draw_text_height_label(xx+70+(ww*0.5),yy+40,roundStrokes,"0",height);

// click on strokes
if click_region(xx,yy,ww*0.5,hh,true,mb_left,submenu) // score
click_textbox_set(roundScore,score_data.score_,kbv_type_numbers);
	
if click_region(xx+(ww*0.5),yy,ww*0.5,hh,true,mb_left,submenu) // strokes
click_textbox_set(roundStrokes,score_data.strokes,kbv_type_numbers);
#endregion

}

