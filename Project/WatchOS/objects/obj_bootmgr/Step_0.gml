//bootMGR
image_angle-=7
if waitTime>0{waitTime--}
else if not keyboard_check(vk_space){
	if gotoSetup=0{room_goto(rm_setupApp)}
	else{
		if encryptedSystem=1 and scr_number_decryption(encryptionKey)!=1267{
			room_goto(rm_recovery)
			//couldn't decrypt system, system halted
		}else{
			if bootDirectory="winterboard"{room_goto(rm_winterboard)}
			else if bootDirectory="terminal"{room_goto(rm_terminal)}
		}
	}
}
else{room_goto(rm_recovery)}