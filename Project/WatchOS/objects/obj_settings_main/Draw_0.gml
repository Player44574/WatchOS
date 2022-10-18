//draw date and time
draw_set_font(font)
draw_set_color(color)
draw_set_alpha(alpha)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text_transformed(cw/2,4,string(hour) + ":" + string(minute),0.5,0.5,0);
draw_sprite(spr_back_icon,0,0,-6);
if page<=3{
	draw_sprite(spr_back_icon,0,0,144+6);
	draw_sprite_ext(spr_back_icon,0,256,144+6,-1,1,0,c_white,1);
	draw_text_transformed(cw/2,160,page,0.5,0.5,0);
}

//reset draw
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(fn_font1)

if page=1{
	draw_button_watchOS(48,"Acerca de WatchOS")
	draw_button_watchOS(48+32,"Actualizaciones")
	draw_button_watchOS(48+32+32,"No molestar")
}else if page=2{
	draw_button_watchOS(48,"Opciones de Always ON")
	draw_button_watchOS(48+32,"Ajustes de fondo")
	draw_button_watchOS(48+32+32,"Idioma")
}else if page=3{
	draw_button_watchOS(48,"Restaurar por defecto")
}else if page=4{
	draw_button_watchOS(48,"Ocultar fondo")
	draw_sprite(spr_toggle,dimBk,256-16-4,48+16)
	draw_button_watchOS(48+32,"Tiempo de espera")
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	draw_text_transformed(256-16-4,48+32+18,inactiveTimer/60,0.4,0.4,0)
	draw_button_watchOS(48+32+32,"Modo ahorro")
	draw_sprite(spr_toggle,lpAlwaysOn,256-16-4,48+32+32+16)
}else if page=5{
	draw_button_watchOS(48,"WatchOS " + string(global.version) + " ("+string(global.versionstring)+")");
}
else if page=6{
	if source="GitHub"{updateServerTXT=("Fuente: "+ string(source)+" (Beta)")}
	else{updateServerTXT=("Fuente: "+ string(source)+" (Release)")}
	
	draw_button_watchOS(48,updateServerTXT);
	
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if CanUpdate=0{draw_button_ext_watchOS(4,ch/2,"No hay versiones\nnuevas",248,64)}
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if CanUpdate=1{draw_button_ext_watchOS(4,ch/2,"Version disponible\n" + string(cloudVersion),248,64)}
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
}

//reset draw
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(fn_font1)