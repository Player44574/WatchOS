//draw app
if room=rm_stopwatch{
	draw_set_color(c_black)
	draw_rectangle(0,0,global.cw,192,false)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_color(c_white)
	if global.stopwatchMiniForm=0{draw_text(global.cw/2,global.ch/2+28,dTimePassed)}
}
	
//reset draw
draw_reset();

//draw date and time ui
if room=rm_stopwatch{
	draw_top_bar_ui(1);
	if stopwatchStart=0{draw_sprite(spr_start_stop_icon,0,global.cw-24-7,2)}
	else if stopwatchStart=1{draw_sprite(spr_start_stop_icon,1,global.cw-24-7,2)}
	
	if stopwatchStart=1 and pause=0{draw_sprite(spr_start_stop_icon,2,global.cw-24-7-24-4,2)}
	if stopwatchStart=1 and pause=1{draw_sprite(spr_start_stop_icon,0,global.cw-24-7-24-4,2)}
}

//reset draw
draw_reset();