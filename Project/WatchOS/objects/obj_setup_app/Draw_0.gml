//drawPhases
draw_set_color(backgroundColor)
draw_rectangle(0,0,global.cw,global.ch,false)
draw_set_color(c_white)

draw_set_alpha(0.5)
draw_roundrect_color_ext(16+3,16+3,(global.cw-16)+3,(global.ch-16)+3,16,16,c_white,c_black,false)
draw_set_alpha(1)
draw_roundrect_color_ext(16,16,global.cw-16,global.ch-16,16,16,foregroundColor,foregroundColor,false)

if setupPhase=0{//initial hello
	draw_set_color(textcolor)
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	draw_text(global.cw/2,96,"WatchOS")
	draw_set_alpha(0.5)
	draw_text(global.cw/2+2,96+2,"WatchOS")
	draw_set_alpha(1)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	if scr_draw_button(global.cw/2-64,global.ch-104,96,48,setUpBlue,"Start",noone,0,1,1,textcolor,0.5)=2{
		setupPhase=1
	}
}
else if setupPhase=1{//language
	draw_set_color(textcolor)
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if global.languaje="en"{draw_text(global.cw/2,64,"Languaje")}else if global.languaje="es"{draw_text(global.cw/2,64,"Idioma")}
	draw_set_alpha(0.5)
	if global.languaje="en"{draw_text(global.cw/2+2,64+2,"Languaje")}else if global.languaje="es"{draw_text(global.cw/2+2,64+2,"Idioma")}
	draw_set_alpha(1)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	if scr_draw_button(global.cw/2-72,global.ch/2+(8-48),144,48,setUpBlue,"English",noone,0,1,1,textcolor,0.5)=2{global.languaje="en"}
	if scr_draw_button(global.cw/2-72,global.ch/2+(8+48),144,48,setUpBlue,"Español",noone,0,1,1,textcolor,0.5)=2{global.languaje="es"}

	if scr_draw_button(global.cw-64,32,32,32,setUpBlue,noone,spr_arrow,0,0,0,textcolor,0.5)=2{setupPhase=2}
}
else if setupPhase=2{//displayScaling	
	draw_set_color(textcolor)
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if global.languaje="en"{draw_text(global.cw/2,64,"Diaplay scaling")}else if global.languaje="es"{draw_text(global.cw/2,64,"Escala de pantalla")}
	draw_set_alpha(0.5)
	if global.languaje="en"{draw_text(global.cw/2+2,64+2,"Diaplay scaling")}else if global.languaje="es"{draw_text(global.cw/2+2,64+2,"Escala de pantalla")}
	draw_set_alpha(1)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	if scr_draw_button(global.cw/2-173,global.ch/2+(8+48),165,48,setUpBlue,"100%",noone,0,1,1,textcolor,0.5)=2{
		obj_screen_service.scale=1
	}
	if scr_draw_button(global.cw/2-173,global.ch/2+(8-48),165,48,setUpBlue,"150%",noone,0,1,1,textcolor,0.5)=2{
		obj_screen_service.scale=1.5
	}
	if scr_draw_button(global.cw/2+8,global.ch/2+(8-48),165,48,setUpBlue,"200%",noone,0,1,1,textcolor,0.5)=2{
		obj_screen_service.scale=2
	}
	if global.languaje="en"{textAuto="Automatic"}else if global.languaje="es"{textAuto="Automático"}
	if scr_draw_button(global.cw/2+8,global.ch/2+(8+48),165,48,setUpBlue,textAuto,noone,0,1,1,textcolor,0.5)=2{
		obj_screen_service.scale=0
	}
	
	if scr_draw_button(global.cw-64,32,32,32,setUpBlue,noone,noone,0,0,0,textcolor,0.5)=2{
		setupPhase=3
	}
}
else if setupPhase=3{//user account creation
	draw_set_color(textcolor)
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if global.languaje="en"{draw_text(global.cw/2,64,"User account")}else if global.languaje="es"{draw_text(global.cw/2,64,"Cuenta de usuario")}
	draw_set_alpha(0.5)
	if global.languaje="en"{draw_text(global.cw/2+2,64+2,"User account")}else if global.languaje="es"{draw_text(global.cw/2+2,64+2,"Cuenta de usuario")}
	draw_set_alpha(1)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	if scr_draw_button(global.cw-64,32,32,32,setUpBlue,noone,spr_arrow,0,0,0,textcolor,0.5)=2{
		setupPhase=4
	}
}
else if setupPhase=4{//personalization
	draw_set_color(textcolor)
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if global.languaje="en"{draw_text(global.cw/2,64,"Customization")}else if global.languaje="es"{draw_text(global.cw/2,64,"Personalización")}
	draw_set_alpha(0.5)
	if global.languaje="en"{draw_text(global.cw/2+2,64+2,"Customization")}else if global.languaje="es"{draw_text(global.cw/2+2,64+2,"Personalización")}
	draw_set_alpha(1)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	if scr_draw_button(global.cw-64,32,32,32,setUpBlue,noone,spr_arrow,0,0,0,textcolor,0.5)=2{
		setupPhase=5
	}
}
else if setupPhase=5{//done, enjoy WatchOS!		
	draw_set_color(textcolor)
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	if global.languaje="en"{draw_text(global.cw/2,96,"Setup completed!")}else if global.languaje="es"{draw_text(global.cw/2,96,"Completado!")}
	draw_set_alpha(0.5)
	if global.languaje="en"{draw_text(global.cw/2+2,96+2,"Setup completed!")}else if global.languaje="es"{draw_text(global.cw/2+2,96+2,"Completado!")}
	draw_set_alpha(1)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	if global.languaje="en"{stUsingWatchOS="Start using WatchOS"}else if global.languaje="es"{stUsingWatchOS="Vamos!"}
	
	if scr_draw_button(global.cw/2-136,global.ch-104,272,48,setUpBlue,stUsingWatchOS,noone,0,1,1,textcolor,0.5)=2{
		room_goto(rm_winterboard)
	}
}

//reset draw
draw_reset();