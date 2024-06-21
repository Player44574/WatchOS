// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_time_convert_to(variable, format, hz){
	//calculate all no matter the format
	//hour
	var hour=floor(variable/3600/hz)
	
	//minute
	var minute=floor(variable/60/hz)-(hour*60)
	
	//second
	var second=floor(variable/hz)-(minute*60)
	
	//make it look nice
	if hour<10{hour="0"+string(hour)}
	if minute<10{minute="0"+string(minute)}
	if second<10{second="0"+string(second)}
	
	//choose the format
	if format="hh"{var output=string(hour)}
	if format="mm"{var output=string(minute)}
	if format="ss"{var output=string(second)}
	if format="hh:mm"{var output=string(hour)+":"+string(minute)}
	if format="mm:ss"{var output=string(minute)+":"+string(second)}
	if format="hh:mm:ss"{var output=string(hour)+":"+string(minute)+":"+string(second)}

	return output
}