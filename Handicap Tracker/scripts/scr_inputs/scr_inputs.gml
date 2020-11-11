function scr_inputs() {
	
androidBack = input_android_back(vk_down,noone,noone) && submenu != navbar.sidebar;
androidBackSidebar = input_android_back(vk_down,noone,noone);

//if androidBack
//kvActive = false;

if os_type == os_android 
var bs_key = keyboard_check_released(vk_backspace);
else if os_type == os_windows
var bs_key = keyboard_check_pressed(vk_backspace);

kv_input_backspace = !androidBack && bs_key;
virtual_keyboard_enter = keyboard_check_released(vk_return);

// monitor mouse distances
if mouse_check_button_pressed(mb_left)
	{
	mouse_xstart = mouse_x;
	mouse_ystart = mouse_y;
	}

mouse_xdist = mouse_x-mouse_xstart;
mouse_ydist = mouse_y-mouse_ystart;

if mouse_check_button(mb_left) && ((abs(mouse_xdist) >= 10) || (abs(mouse_ydist) >= 5))
clickMoved = true;
	
canClick = !clickMoved;
	
// released click
if mouse_check_button_released(mb_left)
	{
	clickMoved = false;
	timer[timerIndex.press_hold] = -1;
	}

scr_debug_inputs();

scr_cursor_position_set(keyboard_string,textboxStringScale); // set cursor position

}

function scr_debug_inputs() {
	
if os_type == os_android
exit;
	
debug_reset = keyboard_check_pressed(vk_delete);

if debug_reset 
debug_data_reset();

if keyboard_check(vk_control)
	{
	if room_speed == 60
	room_speed = 8;
	}
else if !keyboard_check(vk_control)
	{
	if room_speed == 8
	room_speed = 60;
	}

if keyboard_check_pressed(vk_escape)
game_end();
	
	
}
	
	

