//%attributes = {}


var $userName : Text

$userName:="Gustave"

var $gustave; $ada : cs:C1710.UserEntity
$gustave:=ds:C1482.User.query("Name = :1"; $userName)

If ($gustave=Null:C1517)
	
	$gustave:=ds:C1482.User.new()
	$gustave.Name:="gustave"
	$gustave.Gender:="M"
	$gustave.save()
	
	$ada:=ds:C1482.User.new()
	$ada.Name:="ada"
	$ada.Gender:="F"
	$ada.bf:=$gustave
	$ada.save()
	
End if 