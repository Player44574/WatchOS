if page<=3{
	draw_sprite(spr_back_icon,0,0,144+6);
	draw_sprite_ext(spr_back_icon,0,256,144+6,-1,1,0,c_white,1);
	draw_text_transformed(cw/2,160,page,0.5,0.5,0);
}

//reset draw
draw_reset();

if page=1{
	draw_button_watchOS(48,"Acerca de WatchOS")
	draw_button_watchOS(48+32,"Actualizaciones")
	draw_button_watchOS(48+32+32,"Personalizar")
}else if page=2{
	draw_button_watchOS(48,"Opciones de Always ON")
	draw_button_watchOS(48+32,"No molestar")
	draw_button_watchOS(48+32+32,"Idioma")
}else if page=3{
	draw_button_watchOS(48,"Sonidos")
	draw_button_watchOS(48+32,"Experimental")
	draw_button_watchOS(48+32+32,"Restaurar por defecto")
}else if page=4{
	draw_button_watchOS(48,"Activar AlwaysON")
	draw_sprite(spr_toggle,alwON,256-16-4,48+16)
	draw_button_watchOS(48+32,"Ocultar fondo")
	draw_sprite(spr_toggle,dimBk,256-16-4,48+16+32)
	draw_button_watchOS(48+32+32,"Tiempo de espera")
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if os_type=os_windows{draw_text_transformed(256-16-4,48+32+18+32+6,string(global.inactiveSeconds/60)+"s",0.4,0.4,0)}
	if os_type=os_android{draw_text_transformed(256-16-12,48+32+18+32+6,string(global.inactiveSeconds/60)+"s",0.4,0.4,0)}
	draw_button_watchOS(48+32+32+32,"Modo ahorro")
	draw_sprite(spr_toggle,lpAlwaysOn,256-16-4,48+32+32+16+32)
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
	if CanUpdate=1{draw_button_ext_watchOS(4,ch/2,"Version disponible\n" + string(cloudVersion) + " (" + string(cloudBuild) + ")",248,64)}
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
}else if page=7{
	draw_button_watchOS(48,"Fuente")
	draw_button_watchOS(48+32,"Color")
	draw_button_watchOS(48+32+32,"Fondo")
	draw_button_watchOS(48+32+32+32,"Ajustes de fondo")
}else if page=8{
	
}else if page=9{
	draw_button_personalized_watchOS(48-page9scroll,"",230,230,230,fn_font1)
	draw_button_personalized_watchOS(48+32-page9scroll,"",255, 154, 162,fn_font1)
	draw_button_personalized_watchOS(48+32+32-page9scroll,"",255, 183, 178,fn_font1)
	draw_button_personalized_watchOS(48+32+32+32-page9scroll,"",255, 218, 193,fn_font1)
	
	draw_button_personalized_watchOS(48+32+32+32+32-page9scroll,"",226, 240, 203,fn_font1)
	draw_button_personalized_watchOS(48+32+32+32+32+32-page9scroll,"",181, 234, 215,fn_font1)
	draw_button_personalized_watchOS(48+32+32+32+32+32+32-page9scroll,"",199, 206, 234,fn_font1)
	draw_button_personalized_watchOS(48+32+32+32+32+32+32+32-page9scroll,"",68, 68, 68,fn_font1)
}

//draw date and time
draw_top_bar_ui(1);
//reset draw
draw_reset();