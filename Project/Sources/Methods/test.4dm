//%attributes = {}
var $userName : Text
$userName:="Gustave"
var $firstFriendGender : Object

// With safe if
$firstFriendGender:=New object:C1471()
var $user : cs:C1710.UserEntity
var $userFriends : cs:C1710.UserSelection
$user:=ds:C1482.User.query("Name = :1"; $userName).first()
If ($user#Null:C1517)
	$userFriends:=$user.friends
	If ($userFriends#Null:C1517)
		$firstFriend:=$userFriends.first()
		If ($firstFriend#Null:C1517)
			$firstFriendGender.value:=$firstFriend.Gender
		End if 
	End if 
End if 

// with maybe
$firstFriendGender:=maybe($userName)\
.bind(Formula:C1597(ds:C1482.User.query("Name = :1"; $1).first()))\
.bind(Formula:C1597($1.friends))\
.bind(Formula:C1597($1.first()))\
.bind(Formula:C1597($1.Gender))




