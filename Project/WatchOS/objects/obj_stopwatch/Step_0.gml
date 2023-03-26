if global.activeAlwsON=1 and room!=rm_pomodoro_timer{
	if os_type=os_windows or os_type=os_linux{
		if window_has_focus()=false{
			if inactiveTimer>=0{inactiveTimer--}
			else{if room!=rm_main{room_goto(rm_main)} global.watchInactive=true if stopwatchStart=0{instance_destroy()}else{global.stopwatchMiniForm=1}}
		}else if window_has_focus()=true{inactiveTimer=global.inactiveSeconds}
	}else if os_type=os_android{
		if not mouse_check_button(mb_any){
			if inactiveTimer>=0{inactiveTimer--}
			else{if room!=rm_main{room_goto(rm_main)} global.watchInactive=true if stopwatchStart=0{instance_destroy()}else{global.stopwatchMiniForm=1}}
		}else{inactiveTimer=global.inactiveSeconds}
	}
}
if stopwatchStart=0{
	if point_in_rectangle(mouse_x,mouse_y,0,0,0+48,28) and mouse_check_button_released(mb_any){room_goto(rm_apps) instance_destroy()}
}
if room=rm_stopwatch{
	if point_in_rectangle(mouse_x,mouse_y,global.cw-24-7,2,global.cw-24-7+24,2+24) and mouse_check_button_pressed(mb_any) and stopwatchStart=0{stopwatchStart=1; timePassed=0; dTimePassed="00:00:00"}
	else if point_in_rectangle(mouse_x,mouse_y,global.cw-24-7,2,global.cw-24-7+24,2+24) and mouse_check_button_pressed(mb_any) and stopwatchStart=1{stopwatchStart=0; startedVariables=0; timePassed=0; dTimePassed="00:00:00"}
	
	if stopwatchStart=1 and point_in_rectangle(mouse_x,mouse_y,global.cw-24-7-24-4,2,global.cw-24-7-4,2+24) and mouse_check_button_pressed(mb_any){if pause=0{pause=1}else{pause=0}}
}

if stopwatchStart=1{
	if startedVariables=0{
		startedVariables=1;
		timePassed=0;
		rs=room_speed
	}
	
	if pause=0{timePassed+=rs/room_speed}

	dhourTimeLeft=floor(timePassed/3600/rs)
	if dhourTimeLeft<10{dhourTimeLeft="0"+string(dhourTimeLeft)}else{dhourTimeLeft=dhourTimeLeft}
	dminuteTimeLeft=floor((floor(timePassed/rs)-floor(floor(timePassed/3600/rs)*3600))/60)
	if dminuteTimeLeft<10{dminuteTimeLeft="0"+string(dminuteTimeLeft)}else{dminuteTimeLeft=dminuteTimeLeft}
	dsecondTimeLeft=floor((timePassed/rs)-floor(floor(timePassed/60/rs)*60))
	if dsecondTimeLeft<10{dsecondTimeLeft="0"+string(dsecondTimeLeft)}else{dsecondTimeLeft=dsecondTimeLeft}
	
	if timePassed>215999{dTimePassed=string(string(dhourTimeLeft) + ":" + string(dminuteTimeLeft) + ":" + string(dsecondTimeLeft))}
	else if timePassed>3599{dTimePassed="00:"+string(dminuteTimeLeft)+":"+string(dsecondTimeLeft)}
	else{dTimePassed="00:00:"+string(dsecondTimeLeft)}
	
	if point_in_rectangle(mouse_x,mouse_y,0,0,0+48,28) and mouse_check_button_released(mb_any) and global.stopwatchMiniForm=0{global.stopwatchMiniForm=1 room_goto(rm_apps)}
	if room=rm_stopwatch{global.stopwatchMiniForm=0}else{global.stopwatchMiniForm=1}
}