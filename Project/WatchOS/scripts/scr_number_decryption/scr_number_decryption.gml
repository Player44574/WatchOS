function scr_number_decryption(encryptedNumber){
	//please keep in mind that this is a really easy encryption method, do not imput any real passcode
	//in here.
	
	var decryptedNumber=0
	var randomAdd=string_copy(string(encryptedNumber),1,1)
	var randomMultiplier=string_copy(string(encryptedNumber),2,2)
	var toDecrypt=string_copy(string(encryptedNumber),4,string_length(encryptedNumber)-3)
	var output=0
	
	decryptedNumber=(toDecrypt/randomMultiplier)-randomAdd
	output=decryptedNumber
	
	return output
}