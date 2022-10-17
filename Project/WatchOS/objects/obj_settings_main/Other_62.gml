ini_open("current.ini")
if source="GitHub"{cloudVersion = ini_read_real("version","GitVersion","0.0");}
else{cloudVersion = ini_read_real("version","ItchVersion","0.0");}
ini_close();

if cloudVersion <= global.version{CanUpdate=0} else if cloudVersion > global.version{CanUpdate=1}