if aspectRatio>=1{resolution=window_get_height()/scale}
else{resolution=window_get_width()/scale}

try{
	if serviceEnable=1{
		aspectRatio=window_get_width()/window_get_height();
		camera_set_view_size(view_camera[0],resolution*aspectRatio,resolution);
		surface_resize(application_surface,window_get_width(),window_get_height());
		display_set_gui_size(resolution*aspectRatio, resolution);
	}else{aspectRatio=window_get_width()/window_get_height();}
}catch(e){}

global.cw=camera_get_view_width(view_camera[0]);
global.ch=camera_get_view_height(view_camera[0]);
global.deltatime=60/global.hz