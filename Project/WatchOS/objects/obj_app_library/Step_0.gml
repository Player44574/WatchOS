scr_inactive_detector();

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