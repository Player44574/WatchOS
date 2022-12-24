//draw wallpaper
if wallpaperFit=0{draw_sprite_ext(wallpaper,wallpaperIndex,global.cw/2-((sprite_get_width(wallpaper)/2)/(window_get_width()/256)),global.ch/2-((sprite_get_height(wallpaper)/2)/(window_get_height()/192)),192/window_get_height(),192/window_get_height(),0,c_white,wpalpha);}
if wallpaperFit=1{draw_sprite_ext(wallpaper,wallpaperIndex,0,0,global.cw/sprite_get_width(wallpaper),global.ch/sprite_get_height(wallpaper),0,c_white,wpalpha);}
if wallpaperFit=2{draw_sprite_ext(wallpaper,wallpaperIndex,global.cw/2-sprite_get_width(wallpaper)/2,global.ch/2-sprite_get_height(wallpaper)/2,1,1,0,c_white,wpalpha);}

//draw date and time
draw_top_bar_ui(2);
draw_sprite(spr_alarm_icon,0,8*global.cw/256,56);
draw_sprite(spr_stopwatch_icon,0,(8+48+14)*global.cw/256,56);
draw_sprite(spr_timer_icon,0,(8+48+14+48+14)*global.cw/256,56);
draw_sprite(spr_pomodoro_timer_icon,0,(8+48+14+48+14+48+14)*global.cw/256,56);
//draw_sprite(spr_music_icon,0,8,64+48+8);
//draw_sprite(spr_reminders_icon,0,8+48+14,64+48+8);
//draw_sprite(spr_water_reminder_icon,0,8+48+14+48+14,64+48+8);
draw_sprite(spr_settings_icon,0,(8+48+14+48+14+48+14)*global.cw/256,64+48+8);
//reset draw
draw_reset();