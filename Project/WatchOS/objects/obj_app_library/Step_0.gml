cw=camera_get_view_width(view_camera[0])
ch=camera_get_view_height(view_camera[0])

//Time
if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}

ini_open("savedUserSettings.rConfig");
inactiveSeconds=ini_read_real("WatchFace","InactiveTemp",3);
ini_close();

if window_has_focus()=false{
	if inactiveTimer>=0{inactiveTimer--}
	else{room_goto(rm_main) global.watchInactive=true}
}else if window_has_focus()=true{
	inactiveTimer=inactiveSeconds
}

if point_in_rectangle(mouse_x,mouse_y,0,-6,0+48,-6+48){//back
	if mouse_check_button_released(mb_any){
		room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8,56,8+48,56+48){//alarm
	if mouse_check_button_released(mb_any){
		room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14,56,8+48+14+48,56+48){//stopwatch
	if mouse_check_button_released(mb_any){
		room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14+48+14,56,8+48+14+48+14+48,56+48){//timer
	if mouse_check_button_released(mb_any){
		room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14+48+14+48+14,56,8+48+14+48+14+48+14+48,56+48){//pomodoro timer
	if mouse_check_button_released(mb_any){
		room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8,64+48+8,8+48,64+48+8+48){//music
	if mouse_check_button_released(mb_any){
		room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14,64+48+8,8+48+14+48,64+48+8+48){//reminders
	if mouse_check_button_released(mb_any){
		room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14+48+14,64+48+8,8+48+14+48+14+48,64+48+8+48){//water reminders
	if mouse_check_button_released(mb_any){
		room_goto(rm_main)
	}
}
if point_in_rectangle(mouse_x,mouse_y,8+48+14+48+14+48+14,64+48+8,8+48+14+48+14+48+48+14,64+48+8+48){//water reminders
	if mouse_check_button_released(mb_any){
		room_goto(rm_settings)
	}
}