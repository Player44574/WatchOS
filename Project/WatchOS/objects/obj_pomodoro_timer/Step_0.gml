ini_open("savedUserSettings.rConfig");
inactiveSeconds=ini_read_real("WatchFace","InactiveTemp",3);
ini_close();

if window_has_focus()=false{
	if inactiveTimer>=0{inactiveTimer--}
	else{room_goto(rm_main) global.watchInactive=true}
}else if window_has_focus()=true{
	inactiveTimer=inactiveSeconds
}