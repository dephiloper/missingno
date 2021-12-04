extends Node2D

func _ready():
	randomize()
	
	var day = 10
	$Person1.init(day, null)
	$Person2.init(day, null)
	$Match.match_people(day, $Person1, $Person2)
