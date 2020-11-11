function ini_config() {
	
	
gpu_set_texfilter(true);

app_width = room_width;
app_height = room_height;
	
if os_type == os_android
	{
	// disable fullscreen 
	var flags = 1024|4096;
	display_set_ui_visibility(flags);	
	
	alarm[0] = 10;
	}
else
	{
	var ww = app_width;
	var hh = app_height;
	var scale = 1.5;
	var debug_ww = 2.5;
	
	var window_ww = ww*debug_ww*scale;
	var window_hh = hh*scale;
		
	window_set_size(window_ww,window_hh);
	surface_resize(application_surface,ww*scale,hh*scale);
	display_set_gui_size(app_width,app_height); // set GUI

	var disp_center_ww = display_get_width()*0.5;
	var disp_center_hh = display_get_height()*0.5;
	
	var window_xx = disp_center_ww-(window_ww*0.5);
	var window_yy = disp_center_hh-(window_hh*0.5);
	
	window_set_position(window_xx-200,window_yy);
	}
}
