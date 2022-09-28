cw=camera_get_view_width(view_camera[0])
ch=camera_get_view_height(view_camera[0])

if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}

if window_has_focus()=false{
	if inactiveTimer>=0{inactiveTimer--}
	else{watchInactive=true}
}else if window_has_focus()=true{
	watchInactive=false
	inactiveTimer=6*60
	room_speed=60
}

if watchInactive=true and alpha>0.4{alpha+=0.01}
else if watchInactive=true{room_speed=1}
else if watchInactive=false and alpha>0.7{alpha-=0.01}

if watchInactive=true and wpalpha>0.6{wpalpha-=0.01}
else if watchInactive=true{room_speed=1}
else if watchInactive=false and wpalpha<1{wpalpha+=0.01}