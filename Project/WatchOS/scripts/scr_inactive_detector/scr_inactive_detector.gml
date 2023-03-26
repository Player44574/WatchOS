// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inactive_detector(){
	if global.activeAlwsON=1{
		if os_type=os_windows or os_type=os_linux{
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
}