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

try{
if global.timerMiniForm=1 and global.stopwatchMiniForm=1{draw_text_transformed(cx+cw/2-36,cy+ch/2-8,obj_timer.dTimeLeft,0.3,0.3,0) draw_text_transformed(cx+cw/2+40,cy+ch/2-8,obj_stopwatch.dTimePassed,0.3,0.3,0)}
else if global.timerMiniForm=1{draw_text_transformed(cx+cw/2,cy+ch/2-8,obj_timer.dTimeLeft,0.3,0.3,0)}
else if global.stopwatchMiniForm=1{draw_text_transformed(cx+cw/2,cy+ch/2-8,obj_stopwatch.dTimePassed,0.3,0.3,0)}
else{draw_text_transformed(cx+cw/2,cy+ch/2-8,string(wkday) +", "+string(day)+"/"+string(month)+"/"+string(year),0.3,0.3,0)}
}catch(e){global.timerMiniForm=0}
//draw app icon
if global.watchInactive=false{draw_sprite(spr_app_library,0,cx+4,cy+ch-24-4)}

//reset draw
draw_reset();