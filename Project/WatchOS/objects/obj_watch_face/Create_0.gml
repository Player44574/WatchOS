cw=camera_get_view_width(view_camera[0])
ch=camera_get_view_height(view_camera[0])

if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}

inactiveTimer=6*60
alpha=0.8
wpalpha=0.8

wallpaper=spr_wallpaper