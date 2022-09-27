// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_update(){
	http_get_file("https://github.com/Player44574/WatchOS/blob/main/current.ini", program_directory);

	ini_open("current.ini")
	cloudVersion = ini_read_real("version","build","0.0");
	ini_close();

	if cloudVersion > installedVersion{show_debug_message("Update_found")}
}