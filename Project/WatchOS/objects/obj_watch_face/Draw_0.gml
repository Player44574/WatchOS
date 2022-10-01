//draw wallpaper
draw_set_alpha(wpalpha)
draw_sprite(wallpaper,wallpaperIndex,0,0);
draw_set_alpha(1)

//draw low power mode icon
draw_set_alpha(icalpha)
draw_sprite(spr_low_power_mode,0,256-34,2)
draw_set_alpha(1)

//draw date and time
draw_set_font(font)
draw_set_color(color)
draw_set_alpha(alpha)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(cw/2,ch/2-42,string(hour) + ":" + string(minute))
draw_text_transformed(cw/2,ch/2-8,string(wkday) +", "+string(day)+"/"+string(month)+"/"+string(year),0.3,0.3,0)

//reset draw
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(fn_font1)