//draw date and time
draw_set_font(font)
draw_set_color(color)
draw_set_alpha(alpha)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text_transformed(cw/2,4,string(hour) + ":" + string(minute),0.5,0.5,0);
draw_sprite(spr_back_icon,0,0,-6);
draw_sprite(spr_alarm_icon,0,8,56);
draw_sprite(spr_stopwatch_icon,0,8+48+14,56);
draw_sprite(spr_timer_icon,0,8+48+14+48+14,56);
draw_sprite(spr_pomodoro_timer_icon,0,8+48+14+48+14+48+14,56);
draw_sprite(spr_music_icon,0,8,64+48+8);
draw_sprite(spr_reminders_icon,0,8+48+14,64+48+8);
draw_sprite(spr_water_reminder_icon,0,8+48+14+48+14,64+48+8);
draw_sprite(spr_settings_icon,0,8+48+14+48+14+48+14,64+48+8);
//reset draw
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(fn_font1)