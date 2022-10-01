cw=camera_get_view_width(view_camera[0])
ch=camera_get_view_height(view_camera[0])

//Time
if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}

//date
if current_day<10{day="0" + string(current_day)}else{day=current_day}
if current_month<10{month="0" + string(current_month)}else{month=current_month}
if current_year<10{year="0" + string(current_year)}else{year=current_year}

//weekday
if current_weekday=0{wkday="Sunday"}
if current_weekday=1{wkday="Monday"}
if current_weekday=2{wkday="Tuesday"}
if current_weekday=3{wkday="Wednesday"}
if current_weekday=4{wkday="Thursday"}
if current_weekday=5{wkday="Friday"}
if current_weekday=6{wkday="Saturday"}

if window_has_focus()=false{
	if inactiveTimer>=0{inactiveTimer--}
	else{watchInactive=true}
}else if window_has_focus()=true{
	watchInactive=false
	inactiveTimer=3*60
	room_speed=60
}
if watchInactive=true{if icalpha<0.8{icalpha+=0.02}}
if watchInactive=false{if icalpha>0{icalpha-=0.05}}

if watchInactive=true and alpha<0.8{alpha+=0.01}
else if watchInactive=false and alpha>0.6{alpha-=0.01}

if watchInactive=true and wpalpha>0.6{wpalpha-=0.01}
else if watchInactive=true {room_speed=1}
else if watchInactive=false and wpalpha<1{wpalpha+=0.01}

show_debug_message(string(program_directory) + "data.win")