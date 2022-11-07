cw=camera_get_view_width(view_camera[0])
ch=camera_get_view_height(view_camera[0])

//Time
if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}

if global.activeAlwsON=1{
	if os_type=os_windows{
		if window_has_focus()=false{if inactiveTimer>=0{inactiveTimer--}else{room_goto(rm_main) global.watchInactive=true}
		}else if window_has_focus()=true{inactiveTimer=global.inactiveSeconds}
	}else if os_type=os_android{
		if not mouse_check_button(mb_any){if inactiveTimer>=0{inactiveTimer--}else{room_goto(rm_main) global.watchInactive=true}
		}else{inactiveTimer=global.inactiveSeconds}
	}
}
if point_in_rectangle(mouse_x,mouse_y,0,0,0+48,28){
	if mouse_check_button_released(mb_any){
		if page=1 or page=2 or page=3{room_goto(rm_apps)}
		else if page=4{page=2}
		else if page=5 or page=7 or page=8 or page=9{page=1}
		else if page=6{page=1 CanUpdate=2 updateCheck=0}
	}
}
if point_in_rectangle(mouse_x,mouse_y,0,144+6,0+48,144+6+48){
	if mouse_check_button_released(mb_any){
		if page>1{page--}
	}
}
if point_in_rectangle(mouse_x,mouse_y,256-48,144+6,256,144+6+48){
	if mouse_check_button_released(mb_any){
		if page<3{page++}
	}
}


//page1
if page=1{
	if point_in_rectangle(mouse_x,mouse_y,0,48,256,48+32){
		if mouse_check_button_released(mb_any){
			page=5 minidelay=3
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32,256,48+32+32){
		if mouse_check_button_released(mb_any){
			page=6 minidelay=3
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32,256,48+32+32+32){
		if mouse_check_button_released(mb_any){
			page=7 minidelay=3
		}
	}
}
//page2
if page=2{
	if point_in_rectangle(mouse_x,mouse_y,0,48,256,48+32){
		if mouse_check_button_released(mb_any){
			page=4 minidelay=3
		}
	}
}

//page3
if page=3{
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32,256,48+32+32+32) and mouse_check_button_released(mb_any){
		ini_open("savedUserSettings.rConfig");
		ini_write_real("WatchFace","DimBackground",0);
		ini_write_real("WatchFace","LowPowerAlwaysOn",0);
		if os_type=os_windows{ini_write_real("WatchFace","InactiveTemp",3*60);}
		if os_type=os_android{ini_write_real("WatchFace","InactiveTemp",15*60);}
		ini_write_string("Options","UpdateSource","ITCH");
		ini_write_real("WatchFace","AlwaysOn",1);
		ini_close();
		game_restart();
	}
}
//page4
if page=4 and minidelay=0{
	if point_in_rectangle(mouse_x,mouse_y,0,48,256,48+32){
		if mouse_check_button_released(mb_any){
			if alwON=0{alwON=1}else{alwON=0}
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AlwaysOn",alwON);
			global.activeAlwsON=ini_read_real("WatchFace","AlwaysOn",1);
			ini_close();
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32,256,48+32+32){
		if mouse_check_button_released(mb_any){
			if dimBk=0{dimBk=1}else{dimBk=0}
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DimBackground",dimBk);
			ini_close();
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32,256,48+32+32+32+32){
		if mouse_check_button_released(mb_any){
			if lpAlwaysOn=0{lpAlwaysOn=1}else{lpAlwaysOn=0}
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","LowPowerAlwaysOn",lpAlwaysOn);
			ini_close();
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32,256,48+32+32+32){
		if mouse_check_button_released(mb_any){
			if os_type=os_windows{if global.inactiveSeconds=3*60{inactiveTimer=6*60}else if global.inactiveSeconds=6*60{inactiveTimer=9*60}else{inactiveTimer=3*60}}
			if os_type=os_android{if global.inactiveSeconds=15*60{inactiveTimer=30*60}else if global.inactiveSeconds=30*60{inactiveTimer=60*60}else if global.inactiveSeconds=60*60{inactiveTimer=120*60}else{inactiveTimer=15*60}}
			global.inactiveSeconds=inactiveTimer
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","InactiveTemp",inactiveTimer);
			ini_close();
		}
	}
}else if page=4 and minidelay>0{
	minidelay--
	ini_open("savedUserSettings.rConfig");
	dimBk=ini_read_real("WatchFace","DimBackground",0);
	lpAlwaysOn=ini_read_real("WatchFace","LowPowerAlwaysOn",0);
	inactiveSeconds=ini_read_real("WatchFace","InactiveTemp",3);
	alwON=ini_read_real("WatchFace","AlwaysOn",1);
	ini_close();
}

//page6
if page=6 and minidelay=0{
	
	if updateCheck=0{http_get_file("https://raw.githubusercontent.com/Player44574/WatchOS/main/current.ini", "current.ini"); updateCheck=1}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48,256,48+32){
		if mouse_check_button_released(mb_any){
			if source="GitHub"{source="ITCH"}
			else{source="GitHub"}
			
			ini_open("savedUserSettings.rConfig");
			ini_write_string("Options","UpdateSource",source);
			ini_close();
			
			CanUpdate=2
			updateCheck=0
		}
	}
}else if page=6 and minidelay>0{
	minidelay--
}

//page7
if page=7 and minidelay=0{
	if point_in_rectangle(mouse_x,mouse_y,0,48,256,48+32){
		if mouse_check_button_released(mb_any){
			page=8 minidelay=3
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32,256,48+32+32){
		if mouse_check_button_released(mb_any){
			page=9 minidelay=3
		}
	}
}else if page=7 and minidelay>0{
	minidelay--
}

//page8
if page=8 and minidelay=0{
	//if point_in_rectangle(mouse_x,mouse_y,0,48,256,48+32){
		//if mouse_check_button_released(mb_any){
			
		//}
	//}
}else if page=8 and minidelay>0{
	minidelay--
}

//page9
if page=9 and minidelay=0{
	//if point_in_rectangle(mouse_x,mouse_y,0,48,256,48+32){
		//if mouse_check_button_released(mb_any){
			
		//}
	//}
}else if page=9 and minidelay>0{
	minidelay--
}