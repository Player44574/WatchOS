//draw wallpaper
if wallpaperFit=0{draw_sprite_ext(wallpaper,wallpaperIndex,(global.cw*0)*global.cw/sprite_get_width(wallpaper),(global.ch*0)*global.cw/sprite_get_width(wallpaper),global.cw/sprite_get_width(wallpaper),global.cw/sprite_get_width(wallpaper),0,c_white,wpalpha);}
if wallpaperFit=1{draw_sprite_ext(wallpaper,wallpaperIndex,0,0,global.cw/sprite_get_width(wallpaper),global.ch/sprite_get_height(wallpaper),0,c_white,wpalpha);}
if wallpaperFit=2{draw_sprite_ext(wallpaper,wallpaperIndex,global.cw/2-sprite_get_width(wallpaper)/2,global.ch/2-sprite_get_height(wallpaper)/2,1,1,0,c_white,wpalpha);}

//draw low power mode icon
draw_set_alpha(icalpha)
if lpAlwaysOn=1{draw_sprite(spr_low_power_mode,0,global.cw-34,4)}
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
draw_circle(8,global.ch-24,6,false)
draw_circle(8+12+2,global.ch-24,6,false)
draw_circle(8,global.ch-10,6,false)
draw_circle(8+12+2,global.ch-10,6,false)

//reset draw
draw_reset();