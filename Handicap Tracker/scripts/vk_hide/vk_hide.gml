function vk_hide() {

keyboard_virtual_hide(); // hide keyboard
	
submenu = navbar.hidden;
numpad_value = "";
kvActive = false;
androidBack = false;
	
	/// @description hide the virtual keyboard
	/// @param switching
	/*
	if virtual_keyboard_hide_override
	exit;

	var kb_switch = argument0; // if switching keyboards

	if kb_switch // if switching keyboards
	timer[timerIndex.vk_switch] = vk_switch_time;
	else // canceling out
		{
		textboxIndex = noone; // no textboxes active
		virtual_keyboard_type = noone; // no keyboard
		}

	// shared
	debug_vk_height = 0; // set vk simulation on windows
	virtual_keyboard_active = false; // keyboard not active

	if kvStatus >= vk.showing // if keyboard is visible
	keyboard_virtual_hide(); // hide keyboard

/* end vk_hide */
}
