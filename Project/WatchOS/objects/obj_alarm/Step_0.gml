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