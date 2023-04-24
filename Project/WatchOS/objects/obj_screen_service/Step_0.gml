if selectedResolution=0{
	if aspectRatio>=1{resolution=192;}
	else{resolution=480;}
}
if selectedResolution=1{
	if aspectRatio>=1{resolution=240;}
	else{resolution=600;}
}
if selectedResolution=2{
	if aspectRatio>=1{resolution=288;}
	else{resolution=720;}
}
if selectedResolution=3{
	if aspectRatio>=1{resolution=360;}
	else{resolution=900;}
}

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