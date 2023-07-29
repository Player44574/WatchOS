// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_new_user(userName,userPasscode,admin,systemKey){
	directory_create("users\\"+string(userName))
	directory_create("users\\"+string(userName)+"\\Music")
	directory_create("users\\"+string(userName)+"\\Photos")
	directory_create("users\\"+string(userName)+"\\Recordings")
	directory_create("users\\"+string(userName)+"\\.programdata")
	directory_create("users\\"+string(userName)+"\\.programdata\\Alarm")
	directory_create("users\\"+string(userName)+"\\.programdata\\Metronome")
	directory_create("users\\"+string(userName)+"\\.programdata\\PodomoroTimer")
	directory_create("users\\"+string(userName)+"\\.programdata\\SystemSettings")
	directory_create("users\\"+string(userName)+"\\.programdata\\WatchFaces")
	directory_create("users\\"+string(userName)+"\\.programdata\\Reminders")
	directory_create("users\\"+string(userName)+"\\.programdata\\Calendar")
	directory_create("users\\"+string(userName)+"\\.programdata\\Stopwatch")
	directory_create("users\\"+string(userName)+"\\.programdata\\Timer")
	directory_create("users\\"+string(userName)+"\\.programdata\\CounterApp")
	directory_create("users\\"+string(userName)+"\\.programdata\\WaterReminder")
	directory_create("users\\"+string(userName)+"\\.programdata\\WeatherApp")
	directory_create("users\\"+string(userName)+"\\.programdata\\Music")
	userEncryptedPasscode=scr_number_encryption(userPasscode)
	ini_open("users\\"+string(userName)+"\\wuser.dat")
	ini_write_real("user","admin",admin)
	ini_write_real("user","cred",userEncryptedPasscode)
	ini_write_real("user","sk",systemKey)
	ini_close();
}