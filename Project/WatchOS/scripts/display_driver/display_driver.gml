// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function display_driver(){
	aspectRatio=window_get_width()/window_get_height();
	camera_set_view_size(view_camera[0],720*aspectRatio,720);
	surface_resize(application_surface,window_get_width(),window_get_height());
	display_set_gui_size(720*aspectRatio, 720);
}