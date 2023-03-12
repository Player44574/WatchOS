//reset draw
draw_reset();

if page=1{
	draw_button_watchOS(48-pageScroll,"Acerca de WatchOS")
	draw_button_watchOS(48+32-pageScroll,"Actualizaciones")
	draw_button_watchOS(48+32+32-pageScroll,"Personalizar")
	draw_button_watchOS(48+32+32+32-pageScroll,"Opciones de Always ON")
	draw_button_watchOS(48+32+32+32+32-pageScroll,"No molestar")
	draw_button_watchOS(48+32+32+32+32+32-pageScroll,"Sonidos")
	draw_button_watchOS(48+32+32+32+32+32+32-pageScroll,"Idioma")
	draw_button_watchOS(48+32+32+32+32+32+32+32-pageScroll,"Pantalla")
	draw_button_watchOS(48+32+32+32+32+32+32+32+32-pageScroll,"Restaurar por defecto")
}else if page=2{
	
}else if page=3{
	
}else if page=4{
	draw_button_watchOS(48,"Activar AlwaysON")
	draw_sprite(spr_toggle,alwON,global.cw-16-4,48+16)
	draw_button_watchOS(48+32,"Ocultar fondo")
	draw_sprite(spr_toggle,dimBk,global.cw-16-4,48+16+32)
	draw_button_watchOS(48+32+32,"Tiempo de espera")
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if os_type=os_windows{draw_text_transformed(global.cw-16-4,48+32+18+32+2,string(global.inactiveSeconds/60)+"s",0.4,0.4,0)}
	if os_type=os_android{draw_text_transformed(global.cw-16-12,48+32+18+32+2,string(global.inactiveSeconds/60)+"s",0.4,0.4,0)}
	draw_button_watchOS(48+32+32+32,"Modo ahorro")
	draw_sprite(spr_toggle,lpAlwaysOn,global.cw-16-4,48+32+32+16+32)
}else if page=5{
	draw_button_watchOS(48,"WatchOS " + string(global.version) + " ("+string(global.versionstring)+")");
	draw_button_watchOS(48+32,"JPro404 2023");
}else if page=6{
	if source="GitHub"{updateServerTXT=("Fuente: "+ string(source)+" (Beta)")}
	else{updateServerTXT=("Fuente: "+ string(source)+" (Release)")}
	
	draw_button_watchOS(48,updateServerTXT);
	
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if CanUpdate=0{draw_button_ext_watchOS(cw/2-125,ch/2,"No hay versiones\nnuevas",248,64)}
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if CanUpdate=1{draw_button_ext_watchOS(cw/2-125,ch/2,"Version disponible\n" + string(cloudVersion) + " (" + string(cloudBuild) + ")",248,64)}
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if CanUpdate=3{draw_button_ext_watchOS(cw/2-125,ch/2,"Error con servidor\nde actualizaciones",248,64)}
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
}else if page=7{
	draw_button_watchOS(48,"Fuente")
	draw_button_watchOS(48+32,"Color")
	draw_button_watchOS(48+32+32,"Fondo")
	draw_button_watchOS(48+32+32+32,"Ajustes de fondo")
}else if page=8{
	draw_button_personalized_watchOS(48-pageScroll,"Roboto",0,0,0,fn_font1)
	draw_button_personalized_watchOS(48+32-pageScroll,"Sketchzone",0, 0, 0,fn_font2)
	draw_button_personalized_watchOS(48+32+32-pageScroll,"BeachFly",0, 0, 0,fn_font3)
	draw_button_personalized_watchOS(48+32+32+32-pageScroll,"Bubblegum",0, 0, 0,fn_font4)
	draw_button_personalized_watchOS(48+32+32+32+32-pageScroll,"Comico", 0, 0, 0,fn_font5)
	draw_button_personalized_watchOS(48+32+32+32+32+32-pageScroll,"Freshman",0, 0, 0,fn_font6)
	draw_button_personalized_watchOS(48+32+32+32+32+32+32-pageScroll,"Gang of Three",0, 0, 0,fn_font7)
	draw_button_personalized_watchOS(48+32+32+32+32+32+32+32-pageScroll,"KG Happy",0, 0, 0,fn_font8)
	
	if slfont=0{draw_sprite(spr_check_mark,0,global.cw-16-4,48+16-pageScroll)}
	else if slfont=1{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+16-pageScroll)}
	else if slfont=2{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+16-pageScroll)}
	else if slfont=3{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+16-pageScroll)}
	else if slfont=4{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+32+16-pageScroll)}
	else if slfont=5{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+32+32+16-pageScroll)}
	else if slfont=6{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+32+32+32+16-pageScroll)}
	else if slfont=7{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+32+32+32+32+16-pageScroll)}
}else if page=9{
	draw_button_personalized_watchOS(48-pageScroll,"",230,230,230,fn_font1)
	draw_button_personalized_watchOS(48+32-pageScroll,"",255, 150, 136,fn_font1)
	draw_button_personalized_watchOS(48+32+32-pageScroll,"",255, 218, 158,fn_font1)
	draw_button_personalized_watchOS(48+32+32+32-pageScroll,"",253, 253, 150,fn_font1)
	draw_button_personalized_watchOS(48+32+32+32+32-pageScroll,"",165, 238, 160,fn_font1)
	draw_button_personalized_watchOS(48+32+32+32+32+32-pageScroll,"",178, 218, 250,fn_font1)
	draw_button_personalized_watchOS(48+32+32+32+32+32+32-pageScroll,"",192, 160, 195,fn_font1)
	draw_button_personalized_watchOS(48+32+32+32+32+32+32+32-pageScroll,"",68, 68, 68,fn_font1)
	
	if slcolor=0{draw_sprite_ext(spr_check_mark,0,global.cw-16-4,48+16-pageScroll,1,1,0,c_black,1)}
	else if slcolor=1{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+16-pageScroll)}
	else if slcolor=2{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+16-pageScroll)}
	else if slcolor=3{draw_sprite_ext(spr_check_mark,0,global.cw-16-4,48+32+32+32+16-pageScroll,1,1,0,c_black,1)}
	else if slcolor=4{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+32+16-pageScroll)}
	else if slcolor=5{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+32+32+16-pageScroll)}
	else if slcolor=6{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+32+32+32+16-pageScroll)}
	else if slcolor=7{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+32+32+32+32+16-pageScroll)}
}else if page=10{
	draw_button_watchOS(48,"Ajustado")
	draw_button_watchOS(48+32,"Estirado")
	draw_button_watchOS(48+32+32,"Centrado")
	
	if wallpaperFit=0{draw_sprite(spr_check_mark,0,global.cw-16-4,48+16)}
	if wallpaperFit=1{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+16)}
	if wallpaperFit=2{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+16)}
}else if page=11{
	
}else if page=12{
	draw_button_watchOS(48,"192p")
	draw_button_watchOS(48+32,"240p")
	draw_button_watchOS(48+32+32,"288p")
	draw_button_watchOS(48+32+32+32,"360p")
	
	if obj_screen_service.selectedResolution=0{draw_sprite(spr_check_mark,0,global.cw-16-4,48+16)}
	if obj_screen_service.selectedResolution=1{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+16)}
	if obj_screen_service.selectedResolution=2{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+16)}
	if obj_screen_service.selectedResolution=3{draw_sprite(spr_check_mark,0,global.cw-16-4,48+32+32+32+16)}
}

//draw date and time
draw_top_bar_ui(1);
//reset draw
draw_reset();