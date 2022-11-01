//draw app
if timerStart=0{
	draw_set_color(c_black)
	draw_rectangle(0,0,256,192,false)

	draw_sprite(spr_arrow,0,256/2-48,64)
	draw_sprite(spr_arrow,0,256/2-48+32+24,64)

	draw_sprite_ext(spr_arrow,0,256/2-48,160,1,-1,0,c_white,1)
	draw_sprite_ext(spr_arrow,0,256/2-48+32+24,160,1,-1,0,c_white,1)

	draw_set_color(c_white);
	draw_text_transformed(256/2-56,64+26,dHours,0.7,0.7,0)
	draw_text_transformed(256/2-48+32+18,64+26,dMinutes,0.7,0.7,0)
}else if room=rm_timer{
	draw_set_color(c_black)
	draw_rectangle(0,0,256,192,false)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_color(c_white)
	if global.timerMiniForm=0{draw_text(256/2,192/2+28,dTimeLeft)}
	//reset draw
	draw_reset();
}
//draw date and time ui
if room=rm_timer{
	draw_top_bar_ui(1);
	if timerStart=0{draw_sprite(spr_start_stop_icon,0,256-24-7,2)}
	else if timerStart=1{draw_sprite(spr_start_stop_icon,1,256-24-7,2)}
}

//reset draw
draw_reset();