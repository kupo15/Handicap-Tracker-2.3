function ini_highlight_vars() {
	
click_highlight_xpos = 0;
click_highlight_ypos = 0;
click_highlight_width = 0;
click_highlight_width_end = 0;
click_highlight_height = 0;
click_highlight_alpha = 0;
click_highlight_alpha_end = 0;
click_highlight_color = c_gray;
click_highlight_screen = noone;
click_highlight_index = noone;
}

function scr_click_highlight_set(xx,yy,ww,hh,col,screen_ind){

if col == c_yellow
col = c_gray;

click_highlight_xpos = xx;
click_highlight_ypos = yy;

click_highlight_width = ww*0.2;
click_highlight_width_end = ww;

click_highlight_height = hh;
click_highlight_alpha = 0;
click_highlight_alpha_end = 1;
click_highlight_color = col;
click_highlight_screen = screen_ind;
// click_highlight_index = ind;
}

function draw_highlight_click() {
	
var xx = click_highlight_xpos;
var yy = click_highlight_ypos;
var hh = click_highlight_height;
var col = click_highlight_color;

// lerp position
if click_highlight_width != click_highlight_width_end
click_highlight_width = lerp(click_highlight_width,click_highlight_width_end,click_highlight_lerp);

// lerp alpha
if click_highlight_alpha != click_highlight_alpha_end
click_highlight_alpha = lerp(click_highlight_alpha,click_highlight_alpha_end,click_highlight_lerp*0.9);

// set values
var ww = click_highlight_width*0.5;
var alpha = click_highlight_alpha*(click_highlight_screen == screen_index);

draw_set_alpha(0.4*alpha);
draw_roundrect_color(xx-ww,yy,xx+ww,yy+hh,col,col,false); // draw highlight
draw_set_alpha(1);

// when to fade away
var mx = mouse_x;
var my = mouse_y;

var ww = click_highlight_width_end;
var hh = click_highlight_height;
var x_left = xx-(ww*0.5);
var y_top = yy;

var inside = (mx > x_left) && (mx < x_left+ww) && (my > y_top) && (my < y_top+hh);
var clickout = ((click_highlight_width/click_highlight_width_end) > 0.99) && !mouse_check_button(mb_left);
var curs_moved = abs(mouse_ydist) > 10;
var width_reached = abs(click_highlight_width_end-click_highlight_width) < 5

// fade away when released OR not inside of box
if clickout || !inside || (curs_moved && width_reached)
click_highlight_alpha_end = 0; // fade away
}
	
function click_highlight_set_clamped(yy,off_pos,sep,hh) {

	var ypos = yy+(off_pos*sep);
	var ypos_clamp = clamp(ypos,yy,yy+hh); // clamp between window
		
	var sep_adj = abs(ypos-ypos_clamp); // remaining height after clamped
	var hl_sep = sep-sep_adj;
		
	// if hanging off the bottom
	if ypos+hl_sep > yy+hh
	hl_sep = yy+hh-ypos;
		
	click_highlight_ypos = ypos_clamp;
	click_highlight_height = hl_sep;

}