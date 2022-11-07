if global.activeAlwsON=1{
	if os_type=os_windows{
		if window_has_focus()=false and pomodoroTimerStart=0{
			if inactiveTimer>=0{inactiveTimer--}
			else{room_goto(rm_main) global.watchInactive=true}
		}else if window_has_focus()=true and pomodoroTimerStart=0{
			inactiveTimer=global.inactiveSeconds
		}
	}else if os_type=os_android{
		if not mouse_check_button(mb_any) and pomodoroTimerStart=0{
			if inactiveTimer>=0{inactiveTimer--}
			else{room_goto(rm_main) global.watchInactive=true}
		}else if pomodoroTimerStart=0{
			inactiveTimer=global.inactiveSeconds
		}
	}
}
if pomodoroTimerStart=0{
	if workingMinutes<10{dworkingMinutes="0"+string(workingMinutes)}else{dworkingMinutes=workingMinutes}
	if workingHours<10{dworkingHours="0"+string(workingHours)}else{dworkingHours=workingHours}
	if relaxingMinutes<10{drelaxingMinutes="0"+string(relaxingMinutes)}else{drelaxingMinutes=relaxingMinutes}
	if relaxingHours<10{drelaxingHours="0"+string(relaxingHours)}else{drelaxingHours=relaxingHours}

	if point_in_rectangle(mouse_x,mouse_y,24,64,24+32,64+24) and mouse_check_button_pressed(mb_any){if workingHours<23{workingHours+=1}else{workingHours=0}}
	if point_in_rectangle(mouse_x,mouse_y,24+32+24,64,24+32+24+32,64+24) and mouse_check_button_pressed(mb_any){if workingMinutes<59{workingMinutes+=1}else if workingHours>=1{workingMinutes=0}else{workingMinutes=1}}
	if point_in_rectangle(mouse_x,mouse_y,256-24-32,64,256-24-32+32,64+24) and mouse_check_button_pressed(mb_any){if relaxingMinutes<59{relaxingMinutes+=1}else if relaxingHours>=1{relaxingMinutes=0}else{relaxingMinutes=1}}
	if point_in_rectangle(mouse_x,mouse_y,256-24-32-32-24,64,256-24-32-32-24+32,64+24) and mouse_check_button_pressed(mb_any){if relaxingHours<23{relaxingHours+=1}else{relaxingHours=0}}

	if point_in_rectangle(mouse_x,mouse_y,24,160-24,24+32,160+24-24) and mouse_check_button_pressed(mb_any){if workingHours>0{workingHours-=1}else{workingHours=23}}
	if point_in_rectangle(mouse_x,mouse_y,24+32+24,160-24,24+32+24+32,160+24-24) and mouse_check_button_pressed(mb_any){if workingMinutes>1{workingMinutes-=1}else if workingHours>=1 and workingMinutes>0{workingMinutes-=1}else{workingMinutes=59}}
	if point_in_rectangle(mouse_x,mouse_y,256-24-32,160-24,256-24-32+32,160+24-24) and mouse_check_button_pressed(mb_any){if relaxingMinutes>1{relaxingMinutes-=1}else if relaxingHours>=1 and relaxingMinutes>0{relaxingMinutes-=1}else{relaxingMinutes=59}}
	if point_in_rectangle(mouse_x,mouse_y,256-24-32-32-24,160-24,256-24-32-32-24+32,160+24-24) and mouse_check_button_pressed(mb_any){if relaxingHours>0{relaxingHours-=1}else{relaxingHours=23}}

	if workingMinutes=0 and workingHours=0{workingMinutes=1}
	if relaxingMinutes=0 and relaxingHours=0{relaxingMinutes=1}
}

if point_in_rectangle(mouse_x,mouse_y,256-24-7,2,256-24-7+24,2+24) and mouse_check_button_pressed(mb_any) and pomodoroTimerStart=0{pomodoroTimerStart=1;}
else if point_in_rectangle(mouse_x,mouse_y,256-24-7,2,256-24-7+24,2+24) and mouse_check_button_pressed(mb_any) and pomodoroTimerStart=1{pomodoroTimerStart=0; startedVariables=0;}

if pomodoroTimerStart=1 and point_in_rectangle(mouse_x,mouse_y,256-24-7-24-4,2,256-24-7-4,2+24) and mouse_check_button_pressed(mb_any){if pause=0{pause=1}else{pause=0}}

if pomodoroTimerStart=1{
	if startedVariables=0{
		startedVariables=1;
		inicialTimer=10*room_speed;
		fase=0;
		workingTimeLeft=(workingHours*3600+workingMinutes*60)*room_speed
		relaxingTimeLeft=(relaxingHours*3600+relaxingMinutes*60)*room_speed
	}
	
	if fase=0{if inicialTimer>0 and pause=0{inicialTimer--}else if pause=0{fase=1 audio_play_sound(snd_notification,0,0)}}
	if fase=1{if workingTimeLeft>0 and pause=0{workingTimeLeft--}else if pause=0{fase=2 relaxingTimeLeft=(relaxingHours*3600+relaxingMinutes*60)*room_speed audio_play_sound(snd_notification,0,0)}}
	if fase=2{if relaxingTimeLeft>0 and pause=0{relaxingTimeLeft--}else if pause=0{fase=1 workingTimeLeft=(workingHours*3600+workingMinutes*60)*room_speed audio_play_sound(snd_notification,0,0)}}
	
	if fase=0{pomodoroBackgroundColor=c_gray}
	if fase=1{pomodoroBackgroundColor=make_color_rgb(50,115,255);}
	if fase=2{pomodoroBackgroundColor=make_color_rgb(110, 206, 138);}
	
	dInitialTimer=string(floor(inicialTimer/room_speed))
	if dInitialTimer<10{dInitialTimer="00:00:0"+dInitialTimer}else{dInitialTimer=dInitialTimer}

	dhourWrokingTimeLeft=floor(workingTimeLeft/3600/room_speed)
	if dhourWrokingTimeLeft<10{dhourWrokingTimeLeft="0"+string(dhourWrokingTimeLeft)}else{dhourWrokingTimeLeft=dhourWrokingTimeLeft}
	dminuteWrokingTimeLeft=floor((floor(workingTimeLeft/room_speed)-floor(floor(workingTimeLeft/3600/room_speed)*3600))/60)
	if dminuteWrokingTimeLeft<10{dminuteWrokingTimeLeft="0"+string(dminuteWrokingTimeLeft)}else{dminuteWrokingTimeLeft=dminuteWrokingTimeLeft}
	dsecondWrokingTimeLeft=floor((workingTimeLeft/room_speed)-floor(floor(workingTimeLeft/60/room_speed)*60))
	if dsecondWrokingTimeLeft<10{dsecondWrokingTimeLeft="0"+string(dsecondWrokingTimeLeft)}else{dsecondWrokingTimeLeft=dsecondWrokingTimeLeft}
	
		dhourRelaxingTimeLeft=floor(relaxingTimeLeft/3600/room_speed)
	if dhourRelaxingTimeLeft<10{dhourRelaxingTimeLeft="0"+string(dhourRelaxingTimeLeft)}else{dhourRelaxingTimeLeft=dhourRelaxingTimeLeft}
	dminuteRelaxingTimeLeft=floor((floor(relaxingTimeLeft/room_speed)-floor(floor(relaxingTimeLeft/3600/room_speed)*3600))/60)
	if dminuteRelaxingTimeLeft<10{dminuteRelaxingTimeLeft="0"+string(dminuteRelaxingTimeLeft)}else{dminuteRelaxingTimeLeft=dminuteRelaxingTimeLeft}
	dsecondRelaxingTimeLeft=floor((relaxingTimeLeft/room_speed)-floor(floor(relaxingTimeLeft/60/room_speed)*60))
	if dsecondRelaxingTimeLeft<10{dsecondRelaxingTimeLeft="0"+string(dsecondRelaxingTimeLeft)}else{dsecondRelaxingTimeLeft=dsecondRelaxingTimeLeft}
	
	if workingTimeLeft>215999{dworkingTimeLeft=string(string(dhourWrokingTimeLeft) + ":" + string(dminuteWrokingTimeLeft) + ":" + string(dsecondWrokingTimeLeft))}
	else if workingTimeLeft>3599{dworkingTimeLeft="00:"+string(dminuteWrokingTimeLeft)+":"+string(dsecondWrokingTimeLeft)}
	else{dworkingTimeLeft="00:00:"+string(dsecondWrokingTimeLeft)}
	
	if relaxingTimeLeft>215999{drelaxingTimeLeft=string(string(dhourRelaxingTimeLeft) + ":" + string(dminuteRelaxingTimeLeft) + ":" + string(dsecondRelaxingTimeLeft))}
	else if relaxingTimeLeft>3599{drelaxingTimeLeft="00:"+string(dminuteRelaxingTimeLeft)+":"+string(dsecondRelaxingTimeLeft)}
	else{drelaxingTimeLeft="00:00:"+string(dsecondRelaxingTimeLeft)}

}