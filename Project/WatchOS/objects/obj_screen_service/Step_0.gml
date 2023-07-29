if scale=0{
	if aspectRatio>=1{resolution=window_get_height()/round(window_get_height()/360)}
	else{resolution=window_get_width()/round(window_get_width()/360)}
}else{
	if aspectRatio>=1{resolution=window_get_height()/scale}
	else{resolution=window_get_width()/scale}
}

if iniScale!=scale{alpha=2; iniScale=scale}

if alpha>0{alpha-=0.05}else{alpha=0}

try{
	if serviceEnable=1 and room!=rm_boot_secuence and room!=rm_recovery{
		aspectRatio=window_get_width()/window_get_height();
		camera_set_view_size(view_camera[0],resolution*aspectRatio,resolution);
		surface_resize(application_surface,window_get_width(),window_get_height());
		display_set_gui_size(resolution*aspectRatio, resolution);
	}else if room=rm_recovery{
		aspectRatio=window_get_width()/window_get_height();
		surface_resize(application_surface,window_get_width(),window_get_height());
	}
	else{aspectRatio=window_get_width()/window_get_height();}
}catch(e){}

global.cw=camera_get_view_width(view_camera[0]);
global.ch=camera_get_view_height(view_camera[0]);
global.deltatime=60/global.hz