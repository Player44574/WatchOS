//drawPhases
if global.theme="light"{draw_set_color(c_white)}else{draw_set_color(black1)}
draw_rectangle(0,0,cw,ch,false)
draw_set_color(c_white)

if global.theme="light"{
	draw_set_alpha(0.5)
	draw_roundrect_color_ext(16+3,16+3,(cw-16)+3,(ch-16)+3,16,16,c_white,c_black,false)
	draw_set_alpha(1)
	draw_roundrect_color_ext(16,16,cw-16,ch-16,16,16,white0,white0,false)
}else{
	draw_set_alpha(0.5)
	draw_roundrect_color_ext(16+3,16+3,(cw-16)+3,(ch-16)+3,16,16,c_white,c_black,false)
	draw_set_alpha(1)
	draw_roundrect_color_ext(16,16,cw-16,ch-16,16,16,black0,black0,false)
}

if global.theme="light"{draw_set_color(c_black)}else{draw_set_color(c_white)}
draw_set_valign(fa_center)
draw_set_halign(fa_center)
draw_text_transformed(cw/2,36,"Recovery",0.5,0.5,0)
draw_set_alpha(0.5)
draw_text_transformed(cw/2+2,36+2,"Recovery",0.5,0.5,0)
draw_set_alpha(1)
draw_set_valign(fa_top)
draw_set_halign(fa_left)

if scr_draw_button(cw/2-96,ch-136,192,20,c_blue,"Restore and delete",noone,0,1,0,c_white,0.3)=2{
		directory_destroy("users")
		game_restart();
		surface_resize(application_surface,256,192);
}
if scr_draw_button(cw/2-96,ch-108,192,20,c_blue,"Deactivate encryption key",noone,0,1,0,c_white,0.25)=2{
		
}
if scr_draw_button(cw/2-96,ch-80,192,20,c_blue,"Unlock boot loader",noone,0,1,0,c_white,0.3)=2{
		
}
if scr_draw_button(cw/2-96,ch-52,192,20,c_blue,"Reboot",noone,0,1,0,c_white,0.3)=2{
		game_restart();
		surface_resize(application_surface,256,192);
}

//reset draw
draw_reset();