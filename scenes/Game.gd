extends Node2D

func _ready():
	randomize()
	
	var day = 5
	$Person.init($TraitRelations, day, null)
