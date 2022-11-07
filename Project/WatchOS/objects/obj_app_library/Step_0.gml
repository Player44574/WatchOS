if global.activeAlwsON=1{
	if os_type=os_windows{
		if window_has_focus()=false{
			if inactiveTimer>=0{inactiveTimer--}
			else{room_goto(rm_main) global.watchInactive=true}
		}else if window_has_focus()=true{
			inactiveTimer=global.inactiveSeconds
		}
	}else if os_type=os_android{
		if not mouse_check_button(mb_any){
			if inactiveTimer>=0{inactiveTimer--}
			else{room_goto(rm_main) global.watchInactive=true}
		}else{inactiveTimer=global.inactiveSeconds}
	}
}

if point_in_rectangle(mouse_x,mouse_y,8,56,8+48,56+48){//alarm
	if mouse_check_button_released(mb_any){
		room_goto(rm_alarm)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14,56,8+48+14+48,56+48){//stopwatch
	if mouse_check_button_released(mb_any){
		room_goto(rm_stopwatch)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14+48+14,56,8+48+14+48+14+48,56+48){//timer
	if mouse_check_button_released(mb_any){
		room_goto(rm_timer)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14+48+14+48+14,56,8+48+14+48+14+48+14+48,56+48){//pomodoro timer
	if mouse_check_button_released(mb_any){
		room_goto(rm_pomodoro_timer)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8,64+48+8,8+48,64+48+8+48){//music
	if mouse_check_button_released(mb_any){
		//room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14,64+48+8,8+48+14+48,64+48+8+48){//reminders
	if mouse_check_button_released(mb_any){
		//room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14+48+14,64+48+8,8+48+14+48+14+48,64+48+8+48){//water reminders
	if mouse_check_button_released(mb_any){
		//room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14+48+14+48+14,64+48+8,8+48+14+48+14+48+48+14,64+48+8+48){//setings
	if mouse_check_button_released(mb_any){
		room_goto(rm_settings)
	}
}