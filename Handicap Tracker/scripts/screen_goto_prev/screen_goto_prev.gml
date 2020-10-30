/// @param [submen]
function screen_goto_prev() {

	if argument_count == 1
	submenu = argument[0];

	screen_index = prev_screen;
	prev_screen = noone;


}
