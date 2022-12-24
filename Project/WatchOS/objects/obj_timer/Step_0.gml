if global.activeAlwsON=1{
	if os_type=os_windows{
		if window_has_focus()=false{
			if inactiveTimer>=0{inactiveTimer--}
			else{if room!=rm_main{room_goto(rm_main)} global.watchInactive=true if timerStart=0{instance_destroy()}else{global.timerMiniForm=1}}
		}else if window_has_focus()=true{inactiveTimer=global.inactiveSeconds}
	}else if os_type=os_android{
		if not mouse_check_button(mb_any){
			if inactiveTimer>=0{inactiveTimer--}
			else{if room!=rm_main{room_goto(rm_main)} global.watchInactive=true if timerStart=0{instance_destroy()}else{global.timerMiniForm=1}}
		}else{inactiveTimer=global.inactiveSeconds}
	}
}

if timerStart=0{
	if seconds<10{dSeconds="0"+string(seconds)}else{dSeconds=seconds}
	if minutes<10{dMinutes="0"+string(minutes)}else{dMinutes=minutes}
	if hours<10{dHours="0"+string(hours)}else{dHours=hours}
	
	if point_in_rectangle(mouse_x,mouse_y,global.cw/2+64-32,64,global.cw/2+64,64+24) and mouse_check_button_pressed(mb_any){if seconds<59{seconds+=1}else if seconds>=1{seconds=0}else{seconds=1}}
	if point_in_rectangle(mouse_x,mouse_y,global.cw/2+64-32,160-24,global.cw/2+64,160) and mouse_check_button_pressed(mb_any){if seconds>1{seconds-=1}else if seconds>=1 and seconds>0{seconds-=1}else{seconds=59}}

	if point_in_rectangle(mouse_x,mouse_y,global.cw/2-48,64,global.cw/2-48+32,64+24) and mouse_check_button_pressed(mb_any){if minutes<59{minutes+=1}else{minutes=0}}
	if point_in_rectangle(mouse_x,mouse_y,global.cw/2-48,160-24,global.cw/2-48+32,160) and mouse_check_button_pressed(mb_any){if minutes>0{minutes-=1}else{minutes=59}}
	
	if point_in_rectangle(mouse_x,mouse_y,global.cw/2-64-32,64,global.cw/2-64-32,64+24) and mouse_check_button_pressed(mb_any){if hours<23{hours+=1}else{hours=0}}
	if point_in_rectangle(mouse_x,mouse_y,global.cw/2-64-32,160-24,global.cw/2-64-32,160) and mouse_check_button_pressed(mb_any){if hours>0{hours-=1}else{hours=23}}
	
	if point_in_rectangle(mouse_x,mouse_y,0,0,0+48,28) and mouse_check_button_released(mb_any){room_goto(rm_apps) instance_destroy()}

	if minutes=0 and hours=0{minutes=1}
}
if room=rm_timer{
	if point_in_rectangle(mouse_x,mouse_y,global.cw-24-7,2,global.cw-24-7+24,2+24) and mouse_check_button_pressed(mb_any) and timerStart=0{timerStart=1;}
	else if point_in_rectangle(mouse_x,mouse_y,global.cw-24-7,2,global.cw-24-7+24,2+24) and mouse_check_button_pressed(mb_any) and timerStart=1{timerStart=0; startedVariables=0;}
	
	if timerStart=1 and point_in_rectangle(mouse_x,mouse_y,global.cw-24-7-24-4,2,global.cw-24-7-4,2+24) and mouse_check_button_pressed(mb_any){if pause=0{pause=1}else{pause=0}}
}

if timerStart=1{
	if startedVariables=0{
		startedVariables=1;
		fase=0;
		timeLeft=(hours*3600+minutes*60)*room_speed
		rs=room_speed
	}
	
	if timeLeft>0 and pause=0{timeLeft-=rs/room_speed}else if pause=0{if global.timerMiniForm=0{timerStart=0}else{global.timerMiniForm=0 instance_destroy();}}

	dhourTimeLeft=floor(timeLeft/3600/rs)
	if dhourTimeLeft<10{dhourTimeLeft="0"+string(dhourTimeLeft)}else{dhourTimeLeft=dhourTimeLeft}
	dminuteTimeLeft=floor((floor(timeLeft/rs)-floor(floor(timeLeft/3600/rs)*3600))/60)
	if dminuteTimeLeft<10{dminuteTimeLeft="0"+string(dminuteTimeLeft)}else{dminuteTimeLeft=dminuteTimeLeft}
	dsecondTimeLeft=floor((timeLeft/rs)-floor(floor(timeLeft/60/rs)*60))
	if dsecondTimeLeft<10{dsecondTimeLeft="0"+string(dsecondTimeLeft)}else{dsecondTimeLeft=dsecondTimeLeft}
	
	if timeLeft>215999{dTimeLeft=string(string(dhourTimeLeft) + ":" + string(dminuteTimeLeft) + ":" + string(dsecondTimeLeft))}
	else if timeLeft>3599{dTimeLeft="00:"+string(dminuteTimeLeft)+":"+string(dsecondTimeLeft)}
	else{dTimeLeft="00:00:"+string(dsecondTimeLeft)}
	
	if point_in_rectangle(mouse_x,mouse_y,0,0,0+48,28) and mouse_check_button_released(mb_any) and global.timerMiniForm=0{global.timerMiniForm=1 room_goto(rm_apps)}
	if room=rm_timer{global.timerMiniForm=0}else{global.timerMiniForm=1}
}