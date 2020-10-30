/*
function clickout_region(argument0, argument1, argument2, argument3, argument4, argument5) {
/// @param x
/// @param y
/// @param width
/// @param height
/// @param highlight
/// @param submenu

	var tolerance = 5;
	var xx = argument0-tolerance;
	var yy = argument1-tolerance;
	var ww = argument2+(tolerance*2);
	var hh = argument3+(tolerance*2);
	var highlight = argument4;
	var _sub = argument5;

	if submenu != _sub
	exit;

	if android_back || (can_click && !click_region(xx,yy,ww,hh,noone,highlight) && mouse_check_button_released(mb_left))
	return true;
	else
	return false;


}
