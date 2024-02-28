function scr_create_new_user(userName,userPasscode,admin,systemKey){
	directory_create("users\\"+string(userName))
	directory_create("users\\"+string(userName)+"\\Music")
	directory_create("users\\"+string(userName)+"\\Photos")
	directory_create("users\\"+string(userName)+"\\Recordings")
	directory_create("users\\"+string(userName)+"\\.programdata")
	userEncryptedPasscode=scr_number_encryption(userPasscode)*systemKey
	ini_open("users\\"+string(userName)+"\\.rUser")
	ini_write_real("user","admin",admin)
	ini_write_real("user","cred",userEncryptedPasscode)
	ini_write_real("user","sk",systemKey)
	ini_close();
}