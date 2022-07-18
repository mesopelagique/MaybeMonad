
Class constructor($any : Variant)
	This:C1470.value:=$any
	
Function get()->$return : Variant
	ASSERT:C1129($return#Null:C1517)
	return $return
	
Function bind($function : 4D:C1709.Function)->$maybe : cs:C1710.Maybe
	If (This:C1470.value=Null:C1517)
		$maybe:=This:C1470
	Else 
		$maybe:=cs:C1710.Maybe.new($function.call(Null:C1517; This:C1470.value))
	End if 
	
Function bindM($method : Text)->$maybe : cs:C1710.Maybe
	If (This:C1470.value=Null:C1517)
		$maybe:=This:C1470
	Else 
		var $result : Variant
		EXECUTE METHOD:C1007($method; $result; This:C1470.value)
		$maybe:=cs:C1710.Maybe.new($result)
	End if 