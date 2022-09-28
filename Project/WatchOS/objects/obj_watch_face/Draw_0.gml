draw_set_alpha(wpalpha)
draw_sprite(wallpaper,1,0,0);
draw_set_alpha(1)

draw_set_font(fn_font11)
draw_set_color(c_white)
draw_set_alpha(alpha)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(cw/2,ch/2-42,string(hour) + ":" + string(minute))

//reset draw
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(fn_font11)