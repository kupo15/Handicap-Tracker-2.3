function async_virtual_keyboard() {
	var status = async_load[? "keyboard_status"];

	switch status
		{
		case "hidden": kv_status = vk.hidden; break; 
		case "hiding": kv_status = vk.hiding; break; 
		case "showing": kv_status = vk.showing; break; 
		case "visible": kv_status = vk.visible; break; 
		}
	
	
	if timer[timer_index.vk_switch] == -1 && kv_status <= 1 // not switching
	vk_hide();
	
	// debug showing
	show_debug_message("****"+string(kv_status))
	show_debug_message(async_load[? "screen_height"]);



}
