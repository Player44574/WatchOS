cw=camera_get_view_width(view_camera[0])
ch=camera_get_view_height(view_camera[0])

//Time
if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}

scr_inactive_detector();

if point_in_rectangle(mouse_x,mouse_y,0,0,0+48,28){
	if mouse_check_button_released(mb_any){
		if page=1{room_goto(rm_apps)}
		else if page=4 or page=5 or page=7{page=1 iniScroll=0 pageScroll=0}
		else if page=6{page=1 CanUpdate=2 updateCheck=0 iniScroll=0 pageScroll=0}
		else if page=8 or page=9 or page=10 or page=11{page=7}
	}
}

//page1
if page=1{
	if point_in_rectangle(mouse_x,mouse_y,0,48-pageScroll,global.cw,48+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			page=5 minidelay=3
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32-pageScroll,global.cw,48+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			page=6 minidelay=3
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32-pageScroll,global.cw,48+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			page=7 minidelay=3
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32-pageScroll,global.cw,48+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			page=4 minidelay=3
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32+32+32+32+32-pageScroll,global.cw,48+32+32+32+32+32+32+32+32-pageScroll) and mouse_check_button_released(mb_any) and iniScroll<2{
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
	
	if mouse_check_button(mb_any){
		if iniScroll=0{mypos=mouse_y iniScroll=1 mouseYAccel=0}
		
		if mouse_y>mypos+6 and iniScroll=1{iniScroll=2}
		if mouse_y<mypos-6 and iniScroll=1{iniScroll=2}
		
		if iniScroll=2{if mypos!=mouse_y{mouseYAccel=mouse_y-mypos if pageScroll<0 or pageScroll-mouseYAccel<0{pageScroll=0}else if pageScroll>128 or pageScroll-mouseYAccel>128{pageScroll=128}else{pageScroll-=clamp(mouseYAccel,-scrollClampSpeed,scrollClampSpeed)} mypos=mouse_y}}
	}else{iniScroll=0}
}
//page2
if page=2{
	
}

//page3
if page=3{
	
}
//page4
if page=4 and minidelay=0{
	if point_in_rectangle(mouse_x,mouse_y,0,48,global.cw,48+32){
		if mouse_check_button_released(mb_any){
			if alwON=0{alwON=1}else{alwON=0}
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AlwaysOn",alwON);
			global.activeAlwsON=ini_read_real("WatchFace","AlwaysOn",1);
			ini_close();
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32,global.cw,48+32+32){
		if mouse_check_button_released(mb_any){
			if dimBk=0{dimBk=1}else{dimBk=0}
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DimBackground",dimBk);
			ini_close();
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32,global.cw,48+32+32+32+32){
		if mouse_check_button_released(mb_any){
			if lpAlwaysOn=0{lpAlwaysOn=1}else{lpAlwaysOn=0}
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","LowPowerAlwaysOn",lpAlwaysOn);
			ini_close();
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32,global.cw,48+32+32+32){
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
	
	if point_in_rectangle(mouse_x,mouse_y,0,48,global.cw,48+32){
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
	if point_in_rectangle(mouse_x,mouse_y,0,48,global.cw,48+32){
		if mouse_check_button_released(mb_any){
			page=8 minidelay=3
			iniScroll=0
			pageScroll=0
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32,global.cw,48+32+32){
		if mouse_check_button_released(mb_any){
			page=9 minidelay=3
			iniScroll=0
			pageScroll=0
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32,global.cw,48+32+32+32){
		if mouse_check_button_released(mb_any){
			page=11 minidelay=3
			iniXScroll=0
			pageXScroll=0
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32,global.cw,48+32+32+32+32){
		if mouse_check_button_released(mb_any){
			page=10 minidelay=3
			iniScroll=0
			pageScroll=0
		}
	}
}else if page=7 and minidelay>0{
	minidelay--
}

//page8
if page=8 and minidelay=0{
	if point_in_rectangle(mouse_x,mouse_y,0,48-pageScroll,global.cw,48+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slfont=0
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DisplayFont",slfont);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32-pageScroll,global.cw,48+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slfont=1
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DisplayFont",slfont);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32-pageScroll,global.cw,48+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slfont=2
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DisplayFont",slfont);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32-pageScroll,global.cw,48+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slfont=3
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DisplayFont",slfont);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32+32-pageScroll,global.cw,48+32+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slfont=4
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DisplayFont",slfont);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32+32+32-pageScroll,global.cw,48+32+32+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slfont=5
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DisplayFont",slfont);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32+32+32+32-pageScroll,global.cw,48+32+32+32+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slfont=6
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DisplayFont",slfont);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32+32+32+32+32-pageScroll,global.cw,48+32+32+32+32+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slfont=7
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","DisplayFont",slfont);
			ini_close();
		}
	}
	
	if mouse_check_button(mb_any){
		if iniScroll=0{mypos=mouse_y iniScroll=1 mouseYAccel=0}
		
		if mouse_y>mypos+6 and iniScroll=1{iniScroll=2}
		if mouse_y<mypos-6 and iniScroll=1{iniScroll=2}
		
		if iniScroll=2{if mypos!=mouse_y{mouseYAccel=mouse_y-mypos if pageScroll<0 or pageScroll-mouseYAccel<0{pageScroll=0}else if pageScroll>128 or pageScroll-mouseYAccel>128{pageScroll=128}else{pageScroll-=clamp(mouseYAccel,-scrollClampSpeed,scrollClampSpeed)} mypos=mouse_y}}
	}else{iniScroll=0}
}else if page=8 and minidelay>0{
	minidelay--
	ini_open("savedUserSettings.rConfig");
	slcolor=ini_read_real("WatchFace","AccentColor",0);
	slfont=ini_read_real("WatchFace","DisplayFont",0);
	ini_close();
}

//page9
if page=9 and minidelay=0{
	if point_in_rectangle(mouse_x,mouse_y,0,48-pageScroll,global.cw,48+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slcolor=0
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AccentColor",slcolor);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32-pageScroll,global.cw,48+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slcolor=1
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AccentColor",slcolor);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32-pageScroll,global.cw,48+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slcolor=2
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AccentColor",slcolor);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32-pageScroll,global.cw,48+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slcolor=3
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AccentColor",slcolor);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32+32-pageScroll,global.cw,48+32+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slcolor=4
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AccentColor",slcolor);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32+32+32-pageScroll,global.cw,48+32+32+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slcolor=5
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AccentColor",slcolor);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32+32+32+32-pageScroll,global.cw,48+32+32+32+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slcolor=6
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AccentColor",slcolor);
			ini_close();
		}
	}
	
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32+32+32+32+32+32-pageScroll,global.cw,48+32+32+32+32+32+32+32+32-pageScroll){
		if mouse_check_button_released(mb_any) and iniScroll<2{
			slcolor=7
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","AccentColor",slcolor);
			ini_close();
		}
	}
	
	if mouse_check_button(mb_any){
		if iniScroll=0{mypos=mouse_y iniScroll=1 mouseYAccel=0}
		
		if mouse_y>mypos+6 and iniScroll=1{iniScroll=2}
		if mouse_y<mypos-6 and iniScroll=1{iniScroll=2}
		
		if iniScroll=2{if mypos!=mouse_y{mouseYAccel=mouse_y-mypos if pageScroll<0 or pageScroll-mouseYAccel<0{pageScroll=0}else if pageScroll>128 or pageScroll-mouseYAccel>128{pageScroll=128}else{pageScroll-=clamp(mouseYAccel,-scrollClampSpeed,scrollClampSpeed)} mypos=mouse_y}}
	}else{iniScroll=0}
	
	show_debug_message(iniScroll)
}else if page=9 and minidelay>0{
	minidelay--
	ini_open("savedUserSettings.rConfig");
	slcolor=ini_read_real("WatchFace","AccentColor",0);
	slfont=ini_read_real("WatchFace","DisplayFont",0);
	ini_close();
}
//page10
if page=10 and minidelay=0{
	if point_in_rectangle(mouse_x,mouse_y,0,48,global.cw,48+32){
		if mouse_check_button_released(mb_any){
			wallpaperFit=0
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","wallpaperFit",wallpaperFit);
			ini_close();
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32,global.cw,48+32+32){
		if mouse_check_button_released(mb_any){
			wallpaperFit=1
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","wallpaperFit",wallpaperFit);
			ini_close();
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,48+32+32,global.cw,48+32+32+32){
		if mouse_check_button_released(mb_any){
			wallpaperFit=2
			ini_open("savedUserSettings.rConfig");
			ini_write_real("WatchFace","wallpaperFit",wallpaperFit);
			ini_close();
		}
	}
}else if page=10 and minidelay>0{
	minidelay--
	ini_open("savedUserSettings.rConfig");
	wallpaperFit=ini_read_real("WatchFace","wallpaperFit",0);
	ini_close();
}
//page11
if page=11 and minidelay=0{
	if point_in_rectangle(mouse_x,mouse_y,0-pageXScroll,48,32-pageXScroll,48+32){
		if mouse_check_button_released(mb_any) and iniXScroll<2{
			
		}
	}
	
	if mouse_check_button(mb_any){
		if iniXScroll=0{myXpos=mouse_x iniXScroll=1 mouseXAccel=0}
		
		if mouse_y>myXpos+6 and iniXScroll=1{iniXScroll=2}
		if mouse_y<myXpos-6 and iniXScroll=1{iniXScroll=2}
		
		if iniXScroll=2{if myXpos!=mouse_x{mouseXAccel=mouse_x-myXpos if pageXScroll<0 or pageXScroll-mouseXAccel<0{pageXScroll=0}else if pageXScroll>128 or pageXScroll-mouseXAccel>128{pageXScroll=128}else{pageXScroll-=clamp(mouseXAccel,-scrollClampSpeed,scrollClampSpeed)} myXpos=mouse_x}}
	}else{iniXScroll=0}
}else if page=11 and minidelay>0{
	minidelay--
	ini_open("savedUserSettings.rConfig");
	
	ini_close();
}