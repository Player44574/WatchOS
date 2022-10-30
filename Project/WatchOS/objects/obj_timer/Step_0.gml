ini_open("savedUserSettings.rConfig");
inactiveSeconds=ini_read_real("WatchFace","InactiveTemp",3);
ini_close();

if window_has_focus()=false{
	if inactiveTimer>=0{inactiveTimer--}
	else{room_goto(rm_main) global.watchInactive=true}
}else if window_has_focus()=true{
	inactiveTimer=inactiveSeconds
}

if timerStart=0{
	if minutes<10{dMinutes="0"+string(minutes)}else{dMinutes=minutes}
	if hours<10{dHours="0"+string(hours)}else{dHours=hours}

	if point_in_rectangle(mouse_x,mouse_y,256/2-48,64,256/2-48+32,64+24) and mouse_check_button_pressed(mb_any){if hours<23{hours+=1}}
	if point_in_rectangle(mouse_x,mouse_y,256/2-48+32+24,64,256/2-48+32+24+32,64+24) and mouse_check_button_pressed(mb_any){if minutes<59{minutes+=1}}

	if point_in_rectangle(mouse_x,mouse_y,256/2-48,160-24,256/2-48+32,160+24-24) and mouse_check_button_pressed(mb_any){if hours>0{hours-=1}}
	if point_in_rectangle(mouse_x,mouse_y,256/2-48+32+24,160-24,256/2-48+32+24+32,160+24-24) and mouse_check_button_pressed(mb_any){if minutes>1{minutes-=1}}
}

if point_in_rectangle(mouse_x,mouse_y,256-24-7,2,256-24-7+24,2+24) and mouse_check_button_pressed(mb_any) and timerStart=0{timerStart=1;}
else if point_in_rectangle(mouse_x,mouse_y,256-24-7,2,256-24-7+24,2+24) and mouse_check_button_pressed(mb_any) and timerStart=1{timerStart=0; startedVariables=0;}

if timerStart=1{
	if startedVariables=0{
		startedVariables=1;
		fase=0;
		timeLeft=(hours*3600+minutes*60)*room_speed
		rs=room_speed
	}
	if room_speed!=rs{timeLeft=timeLeft/rs*room_speed}
	
	if timeLeft>0{timeLeft--}else{timerStart=0}

	dhourTimeLeft=floor(timeLeft/3600/room_speed)
	if dhourTimeLeft<10{dhourTimeLeft="0"+string(dhourTimeLeft)}else{dhourTimeLeft=dhourTimeLeft}
	dminuteTimeLeft=floor((floor(timeLeft/room_speed)-floor(floor(timeLeft/3600/room_speed)*3600))/60)
	if dminuteTimeLeft<10{dminuteTimeLeft="0"+string(dminuteTimeLeft)}else{dminuteTimeLeft=dminuteTimeLeft}
	dsecondTimeLeft=floor((timeLeft/room_speed)-floor(floor(timeLeft/60/room_speed)*60))
	if dsecondTimeLeft<10{dsecondTimeLeft="0"+string(dsecondTimeLeft)}else{dsecondTimeLeft=dsecondTimeLeft}
	
	if timeLeft>215999{dTimeLeft=string(string(dhourTimeLeft) + ":" + string(dminuteTimeLeft) + ":" + string(dsecondTimeLeft))}
	else if timeLeft>3599{dTimeLeft="00:"+string(dminuteTimeLeft)+":"+string(dsecondTimeLeft)}
	else{dTimeLeft="00:00:"+string(dsecondTimeLeft)}
}