global.version="0.0"
global.versionstring="A00F"
global.yypatch="00"
//the version string is to identify the exact system version for example "A00F00"
//A = Alpha, B = Beta, R = Release
//XX = kernel version
//F = feature update; M = major bug fix; H = small hotfix
//YY = patch

//bootMGR
image_angle=0

//load resources
global.systemfont=font_add(string(working_directory)+"Resources\\Roboto-Regular.ttf",)

//secureBoot
ini_open("users\\.root\\setupApp.config")
gotoSetup=ini_read_real("setup","completed",0)
ini_close()

ini_open(".system\\bootmgr.cgf")
encryptedSystem=ini_read_real("bootloader","encryptedSystem",1)
bootDirectory=ini_read_string("bootloader","bootTo","winterboard")
waitTime=ini_read_real("bootloader","bootmgtWaitTime",1)*60
ini_close();

ini_open(".system\\secure.key")
encryptionKey=ini_read_real("system","secureKey",clamp(irandom(9999),1000,9999))
ini_close()