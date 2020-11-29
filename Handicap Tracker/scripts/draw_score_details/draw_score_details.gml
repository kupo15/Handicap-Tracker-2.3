function draw_score_details() {

#region header
var bg_col = c_lt_gray;
draw_clear(bg_col);

var str = "Round Score";
draw_screen_header(headerType.back,headerType.none,str);	
#endregion

switch textboxIndex
	{
	case score_data.score_: activeStruct.roundData.grossScore = string_convert_real_numpad(numpad_value,3); break;
	case score_data.strokes: activeStruct.roundData.roundStrokes = string_convert_real_numpad(numpad_value,2); break;
	}	

// exceptions
if activeStruct.roundData.roundStrokes == ""
	{
	activeStruct.roundData.roundStrokes = "0";
	numpad_value = activeStruct.roundData.roundStrokes;
	}

if string_length(activeStruct.roundData.roundStrokes) > 1
&& string_char_at(activeStruct.roundData.roundStrokes,1) == "0"
	{
	activeStruct.roundData.roundStrokes = string_delete(activeStruct.roundData.roundStrokes,1,1);
	numpad_value = activeStruct.roundData.roundStrokes;
	}
	
var roundScore = activeStruct.roundData.grossScore;
var roundStrokes = activeStruct.roundData.roundStrokes;

#region draw tee details
var xx = 0;
var yy = 200;
var ww = app_width
var hh = 370;
var dialgue_end = yy+hh;
var col = c_white;

draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);

var detail_arr = ["Gross Score","Strokes Reduced"];
var detail_val = [roundScore,roundStrokes];

// detail buttons
var size = array_length(detail_arr);
var button_spacing = 10;
var button_sep = ww/size;
var button_ww = button_sep-button_spacing;
var xoff = button_spacing*0.5;

// click on header button
var move = false;

for(var i=0;i<size;i++)
	{
	if click_button(xx+xoff+(i*button_sep),yy+10,detail_arr[i],35,c_black,button_ww,60,c_lt_gray,true,false,submenu)
		{
		textboxIndex = score_data.score_+i;
		move = true;
		}
	
	// draw values
	draw_text_height(xx+xoff+(button_ww*0.5)+(i*button_sep),yy+10+60,detail_val[i],25);
	}

// draw highlight
draw_set_alpha(0.2);	
draw_dialogue_box(xx+xoff+((textboxIndex-score_data.score_)*button_sep),yy+10,button_sep-button_spacing,60,header_color,undefined);
draw_set_alpha(1);
#endregion

if virtual_keyboard_enter 
	{
	textboxIndex = clamp(textboxIndex+1,score_data.score_,score_data.strokes); // move to next textbox
	move = true;
	}

#region draw forward and back arrows
var button_ww = ww*0.5;
var button_hh = 80;
var height = 70;
var xx = 10;
var yy = dialgue_end-button_hh;
var button_col = make_color_rgb(240,240,240);

if click_button(xx,yy,"<<",height,c_black,button_ww,button_hh,button_col,false,false,submenu)
	{
	textboxIndex = clamp(textboxIndex-1,score_data.score_,score_data.strokes);
	move = true;
	}

if click_button(xx+button_ww,yy,">>",height,c_black,button_ww,button_hh,button_col,false,false,submenu)
	{
	textboxIndex = clamp(textboxIndex+1,score_data.score_,score_data.strokes);
	move = true;
	}
	
draw_line_pixel(xx+button_ww,yy+10,1,button_hh-20,c_black,1);
	
#endregion

if move
switch (textboxIndex)
	{	
	case score_data.score_: click_textbox_set(roundScore,textboxIndex,kbv_type_numbers); break;
	
	case score_data.strokes: click_textbox_set(roundStrokes,textboxIndex,kbv_type_numbers); break;
	}
	
#region draw label
var xx = app_width*0.5;
var yy = 320;
var height = 60;

draw_set_halign(fa_center);
draw_text_height(xx,yy,detail_arr[textboxIndex-score_data.score_],height);

// draw value
var height = 70;
draw_text_height(xx,yy+80,detail_val[textboxIndex-score_data.score_],height);	
#endregion	

#region Save
var submit = (roundScore != "");
var hh = element_finished.hh;
var height = element_finished.stringHeight;
var xx = 0;
var yy = app_height-hh;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,submenu) && submit
screen_goto_prev(navbar.hidden);

#endregion	

if androidBack
	{
	activeStruct = struct_copy(score_struct); // revert
	screen_goto_prev(navbar.hidden);
	}
}

