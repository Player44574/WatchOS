cw=camera_get_view_width(view_camera[0])
ch=camera_get_view_height(view_camera[0])
cx=camera_get_view_x(view_camera[0])
cy=camera_get_view_y(view_camera[0])

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
	else{global.watchInactive=true personalize=0 timer=2*60}
}else if window_has_focus()=true{
	global.watchInactive=false
	inactiveTimer=inactiveSeconds
	room_speed=60
}
if global.watchInactive=true{if icalpha<alvalue{icalpha+=0.02}}
if global.watchInactive=false{if icalpha>0{icalpha-=0.05}}

if global.watchInactive=true and alpha<alvalue{alpha+=alch}
else if global.watchInactive=false and alpha>0.65{alpha-=alch}

if global.watchInactive=true and wpalpha>wpalvalue{wpalpha-=alch}
else if global.watchInactive=true {if lpAlwaysOn=1{room_speed=1}else{room_speed=15}}
else if global.watchInactive=false and wpalpha<1{wpalpha+=alch}

if global.watchInactive=false and personalize=0{
	if point_in_rectangle(mouse_x,mouse_y,4,cx+ch-24-4,4+24,cy+ch-24-4+24){
		if mouse_check_button_released(mb_any){
			room_goto(rm_apps);
		}
	}
}

if global.watchInactive=false{
	if point_in_rectangle(mouse_x,mouse_y,cx+cw/2-72,cy+ch/2-48-20,cx+cw/2+72,cy+ch/2-24){
		if mouse_check_button(mb_any) and personalize=0{
			if timer<=0{personalize=1 timer=2*60}
			else{timer--}
		}else if personalize=0 and not mouse_check_button(mb_any){
			timer=2*60
		}
	}
	if point_in_rectangle(mouse_x,mouse_y,0,0,256,ch/2-20){
		if mouse_check_button_pressed(mb_any){
			personalize=0 timer=2*60
		}
	}
}