// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_transform_numbers_to_text(number){
	var resultantString=""
	
	for (var i = 1; i <= string_length(number); i+=2) {
	    if string_copy(number,i,2)="00"{resultantString=resultantString+"0"}
		if string_copy(number,i,2)="01"{resultantString=resultantString+"1"}
		if string_copy(number,i,2)="02"{resultantString=resultantString+"2"}
		if string_copy(number,i,2)="03"{resultantString=resultantString+"3"}
		if string_copy(number,i,2)="04"{resultantString=resultantString+"4"}
		if string_copy(number,i,2)="05"{resultantString=resultantString+"5"}
		if string_copy(number,i,2)="06"{resultantString=resultantString+"6"}
		if string_copy(number,i,2)="07"{resultantString=resultantString+"7"}
		if string_copy(number,i,2)="08"{resultantString=resultantString+"8"}
		if string_copy(number,i,2)="09"{resultantString=resultantString+"9"}
		if string_copy(number,i,2)="10"{resultantString=resultantString+"a"}
		if string_copy(number,i,2)="11"{resultantString=resultantString+"A"}
		if string_copy(number,i,2)="12"{resultantString=resultantString+"b"}
		if string_copy(number,i,2)="13"{resultantString=resultantString+"B"}
		if string_copy(number,i,2)="14"{resultantString=resultantString+"c"}
		if string_copy(number,i,2)="15"{resultantString=resultantString+"C"}
		if string_copy(number,i,2)="16"{resultantString=resultantString+"d"}
		if string_copy(number,i,2)="17"{resultantString=resultantString+"D"}
		if string_copy(number,i,2)="18"{resultantString=resultantString+"e"}
		if string_copy(number,i,2)="19"{resultantString=resultantString+"E"}
		if string_copy(number,i,2)="20"{resultantString=resultantString+"f"}
		if string_copy(number,i,2)="21"{resultantString=resultantString+"F"}
		if string_copy(number,i,2)="22"{resultantString=resultantString+"g"}
		if string_copy(number,i,2)="23"{resultantString=resultantString+"G"}
		if string_copy(number,i,2)="24"{resultantString=resultantString+"h"}
		if string_copy(number,i,2)="25"{resultantString=resultantString+"H"}
		if string_copy(number,i,2)="26"{resultantString=resultantString+"i"}
		if string_copy(number,i,2)="27"{resultantString=resultantString+"I"}
		if string_copy(number,i,2)="28"{resultantString=resultantString+"j"}
		if string_copy(number,i,2)="29"{resultantString=resultantString+"J"}
		if string_copy(number,i,2)="30"{resultantString=resultantString+"k"}
		if string_copy(number,i,2)="31"{resultantString=resultantString+"K"}
		if string_copy(number,i,2)="32"{resultantString=resultantString+"l"}
		if string_copy(number,i,2)="33"{resultantString=resultantString+"L"}
		if string_copy(number,i,2)="34"{resultantString=resultantString+"m"}
		if string_copy(number,i,2)="35"{resultantString=resultantString+"M"}
		if string_copy(number,i,2)="36"{resultantString=resultantString+"n"}
		if string_copy(number,i,2)="37"{resultantString=resultantString+"N"}
		if string_copy(number,i,2)="38"{resultantString=resultantString+"o"}
		if string_copy(number,i,2)="39"{resultantString=resultantString+"O"}
		if string_copy(number,i,2)="40"{resultantString=resultantString+"p"}
		if string_copy(number,i,2)="41"{resultantString=resultantString+"P"}
		if string_copy(number,i,2)="42"{resultantString=resultantString+"q"}
		if string_copy(number,i,2)="43"{resultantString=resultantString+"Q"}
		if string_copy(number,i,2)="44"{resultantString=resultantString+"r"}
		if string_copy(number,i,2)="45"{resultantString=resultantString+"R"}
		if string_copy(number,i,2)="46"{resultantString=resultantString+"s"}
		if string_copy(number,i,2)="47"{resultantString=resultantString+"S"}
		if string_copy(number,i,2)="48"{resultantString=resultantString+"t"}
		if string_copy(number,i,2)="49"{resultantString=resultantString+"T"}
		if string_copy(number,i,2)="50"{resultantString=resultantString+"u"}
		if string_copy(number,i,2)="51"{resultantString=resultantString+"U"}
		if string_copy(number,i,2)="52"{resultantString=resultantString+"v"}
		if string_copy(number,i,2)="53"{resultantString=resultantString+"V"}
		if string_copy(number,i,2)="54"{resultantString=resultantString+"w"}
		if string_copy(number,i,2)="55"{resultantString=resultantString+"W"}
		if string_copy(number,i,2)="56"{resultantString=resultantString+"x"}
		if string_copy(number,i,2)="57"{resultantString=resultantString+"X"}
		if string_copy(number,i,2)="58"{resultantString=resultantString+"y"}
		if string_copy(number,i,2)="59"{resultantString=resultantString+"Y"}
		if string_copy(number,i,2)="60"{resultantString=resultantString+"z"}
		if string_copy(number,i,2)="61"{resultantString=resultantString+"Z"}
	}
	
	return resultantString
}