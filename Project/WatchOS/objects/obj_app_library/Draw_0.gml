//draw date and time
draw_top_bar_ui(2);
draw_sprite(spr_alarm_icon,0,8,56);
draw_sprite(spr_stopwatch_icon,0,8+48+14,56);
draw_sprite(spr_timer_icon,0,8+48+14+48+14,56);
draw_sprite(spr_pomodoro_timer_icon,0,8+48+14+48+14+48+14,56);
//draw_sprite(spr_music_icon,0,8,64+48+8);
//draw_sprite(spr_reminders_icon,0,8+48+14,64+48+8);
//draw_sprite(spr_water_reminder_icon,0,8+48+14+48+14,64+48+8);
draw_sprite(spr_settings_icon,0,8+48+14+48+14+48+14,64+48+8);
//reset draw
draw_reset();