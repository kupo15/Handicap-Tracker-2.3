function ini_config() {
	gpu_set_texfilter(true);

	app_width = 540;
	app_height = 960;
	
	if os_type == os_android
		{
		// disable fullscreen 
		var flags = 1024|4096;
		display_set_ui_visibility(flags);	
	
		alarm[0] = 10;
		}
	else
		{
		var ww = 540;
		var hh = 960;
		var scale = 1;

		window_set_size(ww*2,hh*scale);
		surface_resize(application_surface,ww*scale,hh*scale);

		window_set_position(1500,500);
		}
}
