//draw app
if pomodoroTimerStart=0{
	draw_set_color(c_black)
	draw_rectangle(0,0,256,192,false)

	draw_sprite(spr_arrow,0,24,64)
	draw_sprite(spr_arrow,0,24+32+24,64)
	draw_sprite(spr_arrow,0,256-24-32,64)
	draw_sprite(spr_arrow,0,256-24-32-32-24,64)

	draw_sprite_ext(spr_arrow,0,24,160,1,-1,0,c_white,1)
	draw_sprite_ext(spr_arrow,0,24+32+24,160,1,-1,0,c_white,1)
	draw_sprite_ext(spr_arrow,0,256-24-32,160,1,-1,0,c_white,1)
	draw_sprite_ext(spr_arrow,0,256-24-32-32-24,160,1,-1,0,c_white,1)

	draw_set_color(make_color_rgb(50,115,255))
	draw_text_transformed(18,64+26,dworkingHours,0.7,0.7,0)
	draw_text_transformed(24+32+18,64+26,dworkingMinutes,0.7,0.7,0)
	draw_set_color(make_color_rgb(110, 206, 138))
	draw_text_transformed(256-24-38,64+25,drelaxingMinutes,0.7,0.7,0)
	draw_text_transformed(256-24-32-38-24,64+26,drelaxingHours,0.7,0.7,0)
}else{
	draw_set_color(pomodoroBackgroundColor)
	draw_rectangle(0,0,256,192,false)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_color(c_white)
	if fase=0{draw_text(256/2,192/2+28,dInitialTimer)}
	if fase=1{draw_text(256/2,192/2+28,dworkingTimeLeft)}
	if fase=2{draw_text(256/2,192/2+28,drelaxingTimeLeft)}
	//reset draw
	draw_reset();
}
//draw date and time ui
if pomodoroTimerStart=0{draw_top_bar_ui(0);}else{draw_top_bar_ui(3);}
if pomodoroTimerStart=0{draw_sprite(spr_start_stop_icon,0,256-24-7,2)}
else if pomodoroTimerStart=1{draw_sprite(spr_start_stop_icon,1,256-24-7,2)}

if pomodoroTimerStart=1 and pause=0{draw_sprite(spr_start_stop_icon,2,256-24-7-24-4,2)}
if pomodoroTimerStart=1 and pause=1{draw_sprite(spr_start_stop_icon,0,256-24-7-24-4,2)}

if pomodoroTimerStart=1{
	if fase=0{draw_text_transformed(256/2,192/2-48,"Empezando...",0.5,0.5,0)}
	if fase=1{draw_text_transformed(256/2,192/2-48,"¡A trabajar!",0.5,0.5,0)}
	if fase=2{draw_text_transformed(256/2,192/2-48,"¡Hora de descansar!",0.5,0.5,0)}
}else{
	draw_text_transformed(66,36,"Trabajo",0.3,0.3,0)
	draw_text_transformed(128+62,36,"Ralajación",0.3,0.3,0)
}
//reset draw
draw_reset();