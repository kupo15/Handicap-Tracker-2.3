var ww = display_get_width();
var hh = display_get_height();

surface_resize(application_surface,ww,hh); // resize app surface

display_set_gui_size(ww*0.25,hh*0.25); // set GUI

app_width = ww;
app_height = hh;