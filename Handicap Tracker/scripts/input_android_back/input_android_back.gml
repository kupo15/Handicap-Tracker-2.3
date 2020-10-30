/// @param windows_key
/// @param keyboard_string
/// @param last_string)
function input_android_back(argument0, argument1, argument2) {

	var win_key = argument0;
	var key_str = argument1;
	var laststr = argument2;

	var nav_back = false;

	if os_type == os_windows
		{
		if mouse_check_button_released(mb_right) 
			{
			/*if virtual_keyboard_active
			vk_hide(false);
			else */
			nav_back = true;
			}
		else
		nav_back = keyboard_check_released(win_key);
		}
	else if os_type == os_android
		{
		if keyboard_check_released(vk_backspace) // if backspace
			{
			if kv_status == vk.hidden
			nav_back = true;
			else
			nav_back = false;
			}
		}

	return nav_back;


}
