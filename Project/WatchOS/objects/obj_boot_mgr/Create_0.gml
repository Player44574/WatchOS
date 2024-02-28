//booting time!
global.version=1.0
global.compilationNumber=00
global.compilationVersion="A"
global.compilationString=string(global.version)+" ("+string(global.compilationNumber)+string(global.compilationVersion)+")"

//get system info
ini_open("eMGR.rboot")																	 //file
secureBoot=ini_read_real("system","secureBoot",0)				 //secure boot
global.encryption=ini_read_real("system","encryption",0)		 //system encryption
setupPhase=ini_read_real("system","setup",0)							 //system activation/setup
global.intVer=ini_read_real("system","interpreterVersion",0) //system interpreter version
waitTime=ini_read_real("system","waitTime",30)						 //wait time
displayEnable=ini_read_real("system","displayEnable",1)		 //display driver
ini_close()																								 //close file

//encryption
generatedRandomKey=scr_number_encryption(round(irandom(9999)))
ini_open("device/encrypt.key")																									//file
global.encryptKey=ini_read_real("encryption","key",generatedRandomKey)				//key
ini_close()																																			//close file

//display driver
if displayEnable=1{instance_create_layer(0,0,layer,obj_screen_service)}
window_set_min_width(240)
window_set_min_height(192)

//wait user specified time for recovery options
alarm[0]=waitTime*room_speed