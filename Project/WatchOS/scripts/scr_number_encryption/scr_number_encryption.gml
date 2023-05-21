function scr_number_encryption(decryptedNumber){
	//please keep in mind that this is a really easy encryption method, do not imput any real passcode
	//in here.
	
	var encryptedNumber=0
	var randomMultiplier=round(irandom(99))
	var randomAdd=round(irandom(9))
	var output=0
	
	while randomMultiplier<10{randomMultiplier=round(irandom(99))}
	
	encryptedNumber=(decryptedNumber+randomAdd)*randomMultiplier
	output=string(randomAdd)+string(randomMultiplier)+string(encryptedNumber)
	
	return output
}