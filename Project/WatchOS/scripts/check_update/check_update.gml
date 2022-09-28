// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_update(){
	updateFile = http_get_file("https://raw.githubusercontent.com/Player44574/WatchOS/main/current.ini", "current.ini");
}