//draw wallpaper
draw_set_alpha(wpalpha)
draw_sprite(wallpaper,wallpaperIndex,cx+0,cy+0);
draw_set_alpha(1)

//draw low power mode icon
draw_set_alpha(icalpha)
if lpAlwaysOn=1{draw_sprite(spr_low_power_mode,0,cx+256-34,cy+ch-24-4)}
draw_set_alpha(1)

//draw date and time
draw_set_font(font)
draw_set_color(color)
draw_set_alpha(alpha)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(cx+cw/2,cy+ch/2-42,string(hour) + ":" + string(minute))
if personalize=0{draw_text_transformed(cx+cw/2,cy+ch/2-8,string(wkday) +", "+string(day)+"/"+string(month)+"/"+string(year),0.3,0.3,0)}

//draw app icon
if global.watchInactive=false and personalize=0{draw_sprite(spr_app_library,0,cx+4,cy+ch-24-4)}

//draw personalize page
if personalize=1{
	draw_set_alpha(0.8)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_rectangle(0,ch/2-20,256,192,false)
	draw_set_color(c_black)
	draw_set_alpha(1)
	draw_text_transformed(ch/5*1,192-16,"Fuente",0.3,0.3,0)
	draw_text_transformed(ch/5*3.4,192-16,"Color",0.3,0.3,0)
	draw_text_transformed(ch/5*5.8,192-16,"Fondo",0.3,0.3,0)
	if perpage=0{draw_line(ch/5*1-24,192-8,ch/5*1+24,192-8)}
	if perpage=1{draw_line(ch/5*3.4-24,192-8,ch/5*3.4+24,192-8)}
	if perpage=2{draw_line(ch/5*5.8-24,192-8,ch/5*5.8+24,192-8)}
	
	if perpage=0{
		//first row
		draw_set_font(fn_font1)
		draw_text_transformed(36,ch/2+4,"12",0.8,0.8,0)
		draw_set_font(fn_font2)
		draw_text_transformed(36+60,ch/2+4,"12",0.8,0.8,0)
		draw_set_font(fn_font3)
		draw_text_transformed(36+60+60,ch/2+-2,"12",0.8,0.8,0)
		draw_set_font(fn_font4)
		draw_text_transformed(36+60+60+60,ch/2+4,"12",0.8,0.8,0)
		//second row
		draw_set_font(fn_font5)
		draw_text_transformed(36,ch/2+50,"12",0.8,0.8,0)
		draw_set_font(fn_font6)
		draw_text_transformed(36+60,ch/2+50,"12",0.8,0.8,0)
		draw_set_font(fn_font7)
		draw_text_transformed(36+60+60,ch/2+50,"12",0.8,0.8,0)
		draw_set_font(fn_font8)
		draw_text_transformed(36+60+60+60,ch/2+50,"12",0.8,0.8,0)
	}
}

//reset draw
draw_reset();