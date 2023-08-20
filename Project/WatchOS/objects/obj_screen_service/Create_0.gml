if not file_exists(".system/globalConfigs/display.rConfig"){
	ini_open(".system/globalConfigs/display.rConfig");
	ini_write_real("Display","scale",0);
	ini_write_real("Display","scale",0);
	ini_write_real("Display","frecuency",60);
	ini_write_real("Display","hostFullScreen",0);
	ini_write_real("Developer","displayDriverEnable",1);
	ini_write_real("Developer","windowWidth",640);
	ini_write_real("Developer","windowHeight",360);
	ini_close();
}

ini_open(".system/globalConfigs/display.rConfig");
scale=ini_read_real("Display","scale",0);
iniScale=ini_read_real("Display","scale",0);
global.hz=ini_read_real("Display","frecuency",60);
fullscreen=ini_read_real("Display","hostFullScreen",0);
serviceEnable=ini_read_real("Developer","displayDriverEnable",1);
initialWindowWidth=ini_read_real("Developer","windowWidth",640);
initialWindowHeight=ini_read_real("Developer","windowHeight",360);
ini_close();

aspectRatio=window_get_width()/window_get_height();
global.cw=camera_get_view_width(view_camera[0]);
global.ch=camera_get_view_height(view_camera[0]);
alpha=0

//setRoomSpeed
room_speed=global.hz

//setFullScreen
if fullscreen=1{window_set_fullscreen(true)}
window_set_size(initialWindowWidth,initialWindowHeight)