inactiveTimer=global.inactiveSeconds
alpha=1
font=fn_font1
color=c_white
wpalpha=0.6

ini_open("savedUserSettings.rConfig");
slwallpaper=ini_read_real("WatchFace","WallpaperIndex",0);
wallpaper=ini_read_real("WatchFace","WallpaperImage",spr_wallpaper);
wallpaperFit=ini_read_real("WatchFace","wallpaperFit",0);
ini_close();

if slwallpaper=0 and wallpaper=spr_wallpaper{wallpaperIndex=0}
else if slwallpaper=1 and wallpaper=spr_wallpaper{wallpaperIndex=1}
else if slwallpaper=2 and wallpaper=spr_wallpaper{wallpaperIndex=2}
else if slwallpaper=3 and wallpaper=spr_wallpaper{wallpaperIndex=3}
else if slwallpaper=4 and wallpaper=spr_wallpaper{wallpaperIndex=4}
else {wallpaper=sprite_add("customWallpaper.image",0,0,0,0,0); wallpaperIndex=0}