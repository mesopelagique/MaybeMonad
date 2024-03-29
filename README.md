# Maybe / Monad

Utility object `cs.Maybe` to simplify code that contains multiple `If` not `Null`

For instance

```4d
$firstFriendGender:=New object()

var $user : cs.UserEntity
var $userFriends : cs.UserSelection
$user:=ds.User.query("Name = :1"; $userName).first()
If ($user#Null)
	$userFriends:=$user.friends
	If ($userFriends#Null)
		$firstFriend:=$userFriends.first()
		If ($firstFriend#Null)
			$firstFriendGender.value:=$firstFriend.Gender
		End if 
	End if 
End if 
```

become

```4d
$firstFriendGender:=maybe(ds.User.query("Name = :1"; $userName).first())\
  .bind(Formula($1.friends))\
  .bind(Formula($1.first()))\
  .bind(Formula($1.Gender))
```

by just applying function only if not null


In a langage with a lot of suggar syntax (formula with {}, operator for objects) we could have something like that

```swift
$firstFriendGender:={ ds.User.query("Name = :1"; $userName).first() }
  >>= { $1.friends }
  >>= { $1.first() }
  >>= { $1.Gender }
```
