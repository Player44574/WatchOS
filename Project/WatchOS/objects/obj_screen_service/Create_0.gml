ini_open("savedUserSettings.rConfig");
selectedResolution=ini_read_real("Display","resolution",0);
global.hz=ini_read_real("Display","frecuency",120);
serviceEnable=ini_read_real("Developer","displayDriverEnable",1);
ini_close();
aspectRatio=window_get_width()/window_get_height();

global.cw=camera_get_view_width(view_camera[0]);
global.ch=camera_get_view_height(view_camera[0]);