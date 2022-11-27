//draw wallpaper
if wallpaperFit=0{draw_sprite_ext(wallpaper,wallpaperIndex,global.cw/2-((sprite_get_width(wallpaper)/2)/(window_get_width()/256)),global.ch/2-((sprite_get_height(wallpaper)/2)/(window_get_height()/192)),192/window_get_height(),192/window_get_height(),0,c_white,wpalpha);}
if wallpaperFit=1{draw_sprite_ext(wallpaper,wallpaperIndex,0,0,global.cw/sprite_get_width(wallpaper),global.ch/sprite_get_height(wallpaper),0,c_white,wpalpha);}
if wallpaperFit=2{draw_sprite_ext(wallpaper,wallpaperIndex,global.cw/2-sprite_get_width(wallpaper)/2,global.ch/2-sprite_get_height(wallpaper)/2,1,1,0,c_white,wpalpha);}

//draw low power mode icon
draw_set_alpha(icalpha)
if lpAlwaysOn=1{draw_sprite(spr_low_power_mode,0,256-34,4)}
draw_set_alpha(1)

//draw date and time
draw_set_font(font)
draw_set_color(color)
draw_set_alpha(alpha)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(global.cw/2,global.ch/2-44,string(hour) + ":" + string(minute))

try{
if global.timerMiniForm=1 and global.stopwatchMiniForm=1{draw_text_transformed(global.cw/2-36,global.ch/2-8,obj_timer.dTimeLeft,0.3,0.3,0) draw_text_transformed(global.cw/2+40,global.ch/2-8,obj_stopwatch.dTimePassed,0.3,0.3,0)}
else if global.timerMiniForm=1{draw_text_transformed(global.cw/2,global.ch/2-8,obj_timer.dTimeLeft,0.3,0.3,0)}
else if global.stopwatchMiniForm=1{draw_text_transformed(global.cw/2,global.ch/2-8,obj_stopwatch.dTimePassed,0.3,0.3,0)}
else{draw_text_transformed(global.cw/2,global.ch/2-6,string(wkday) +", "+string(day)+"/"+string(month)+"/"+string(year),0.3,0.3,0)}
}catch(e){global.timerMiniForm=0}

//draw app icon
if global.watchInactive=false and window_get_height()<384{draw_sprite_ext(spr_app_library_s,0,4,global.ch-24-4,1,1,0,c_white,alpha)}
if global.watchInactive=false and window_get_height()>=384 and window_get_height()<768{draw_sprite_ext(spr_app_library_m,0,4,global.ch-24-4,0.5,0.5,0,c_white,alpha)}
if global.watchInactive=false and window_get_height()>768{draw_sprite_ext(spr_app_library_l,0,4,global.ch-24-4,0.25,0.25,0,c_white,alpha)}

//reset draw
draw_reset();