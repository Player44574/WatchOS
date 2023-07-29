global.theme="dark"
global.languaje="en"
setupPhase=0

if global.theme="light"{
	setUpBlue=make_color_rgb(178,218,250)
	foregroundColor=make_color_rgb(222, 222, 222)
	backgroundColor=c_white
	textcolor=c_black
}
else{
	setUpBlue=make_color_rgb(99, 150, 216)
	foregroundColor=make_color_rgb(40, 46, 51)
	backgroundColor=make_color_rgb(16, 18, 4)
	textcolor=c_white
}

//create system directories
if not directory_exists(".system"){
	directory_create(".system")
	directory_create(".system\\temp")
	directory_create(".system\\resources")
	directory_create(".system\\resources\\fonts")
	directory_create(".system\\resources\\notificationSounds")
	directory_create(".system\\resources\\wallpapers")
	ini_open(".system\\secure.key")
	ini_write_real("system","secureKey",scr_number_encryption(1267))
	ini_close()
}
if not directory_exists("users"){
	directory_create("users")
}
if not directory_exists(".backups"){
	directory_create(".backups")
}