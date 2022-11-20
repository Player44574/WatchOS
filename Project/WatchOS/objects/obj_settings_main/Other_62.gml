ini_open("current.ini")
if source="GitHub"{cloudVersion = ini_read_string("version","GitVersion","0.0");}
else{cloudVersion = ini_read_string("version","ItchVersion","0.0");}

if source="GitHub"{cloudBuild = ini_read_string("build","GitBuild","A0000G");}
else{cloudBuild = ini_read_string("build","ItchBuild","R0000I");}
ini_close();

if cloudVersion = "0.0"{CanUpdate=3}

//if cloudVersion <= global.version{CanUpdate=0} else if cloudVersion > global.version{CanUpdate=1}