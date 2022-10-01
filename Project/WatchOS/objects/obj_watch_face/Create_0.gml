cw=camera_get_view_width(view_camera[0])
ch=camera_get_view_height(view_camera[0])

//Time
if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}

//date
if current_day<10{day="0" + string(current_day)}else{day=current_day}
if current_month<10{month="0" + string(current_month)}else{month=current_month}
if current_year<10{year="0" + string(current_year)}else{year=current_year}

//weekday
if current_weekday=0{wkday="Sunday"}
if current_weekday=1{wkday="Monday"}
if current_weekday=2{wkday="Tuesday"}
if current_weekday=3{wkday="Wednesday"}
if current_weekday=4{wkday="Thursday"}
if current_weekday=5{wkday="Friday"}
if current_weekday=6{wkday="Saturday"}

inactiveTimer=3*60
alpha=0.6
wpalpha=1
icalpha=0

ini_open("savedUserSettings.rConfig")
slfont=0
slcolor=0

wallpaper=spr_wallpaper
slwallpaper=0

if slcolor=0{color=c_white}
if slcolor=1{color=make_color_rgb(255, 154, 162)}
if slcolor=2{color=make_color_rgb(255, 183, 178)}
if slcolor=3{color=make_color_rgb(255, 218, 193)}
if slcolor=4{color=make_color_rgb(226, 240, 203)}
if slcolor=5{color=make_color_rgb(181, 234, 215)}
if slcolor=6{color=make_color_rgb(199, 206, 234)}
if slcolor=7{color=make_color_rgb(68, 68, 68)}

if slfont=0{font=fn_font1}
if slfont=1{font=fn_font2}
if slfont=2{font=fn_font3}
if slfont=3{font=fn_font4}
if slfont=4{font=fn_font5}
if slfont=5{font=fn_font6}
if slfont=6{font=fn_font7}
if slfont=7{font=fn_font8}

if slwallpaper=0 and wallpaper=spr_wallpaper{wallpaperIndex=0}
if slwallpaper=1 and wallpaper=spr_wallpaper{wallpaperIndex=1}
if slwallpaper=2 and wallpaper=spr_wallpaper{wallpaperIndex=2}
if slwallpaper=3 and wallpaper=spr_wallpaper{wallpaperIndex=3}