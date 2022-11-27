try{
	aspectRatio=window_get_width()/window_get_height();
	camera_set_view_size(view_camera[0],resolution*aspectRatio,resolution);
	surface_resize(application_surface,window_get_width(),window_get_height());
	display_set_gui_size(resolution*aspectRatio, resolution);
}catch(e){}
global.cw=camera_get_view_width(view_camera[0]);
global.ch=camera_get_view_height(view_camera[0]);

if keyboard_check_released(vk_enter) and keyboard_check_released(vk_alt){
	if window_get_fullscreen()=true{window_set_fullscreen(false)}
	else{window_set_fullscreen(true)}
}