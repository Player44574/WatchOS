cw=camera_get_view_width(view_camera[0])
ch=camera_get_view_height(view_camera[0])

//Time
if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}

ini_open("savedUserSettings.rConfig");
dimBk=ini_read_real("WatchFace","DimBackground",0);
lpAlwaysOn=ini_read_real("WatchFace","LowPowerAlwaysOn",0);
inactiveSeconds=ini_read_real("WatchFace","InactiveTemp",3);
source=ini_read_string("Options","UpdateSource","ITCH");
alwON=ini_read_real("WatchFace","AlwaysOn",1);
ini_close();

inactiveTimer=global.inactiveSeconds
alpha=1
font=fn_font1
color=c_white
page=1
minidelay=3
CanUpdate=2
updateCheck=0
page8scroll=0
page9scroll=0