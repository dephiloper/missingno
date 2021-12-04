extends Node2D

const sheet_scene = preload("res://scenes/ProfileSheet.tscn")
const sheets = []
var selected = 0
var width = 600
var height = 300
var sheet_count = 10

func _ready() -> void:
	for i in range(sheet_count):
		var s = sheet_scene.instance()
		var offset = (-5 + i) * 50 + 25
		s.position.x += offset
		s.initial_offset = s.position
		add_child(s)
		
		sheets.append(s)
		s.idx = i

func _process(delta: float) -> void:
	var new_sheet_pos: Vector2
	
	for i in range(len(sheets)):
		if selected > -1:
			var offset = sign(i - selected) * 100
			new_sheet_pos.x = sheets[i].initial_offset.x + offset
		else:
			new_sheet_pos.x = sheets[i].initial_offset.x
		if i == selected:
			new_sheet_pos.y = -60
		else:
			new_sheet_pos.y = 0
			
		var diff = new_sheet_pos - sheets[i].position
		if diff.length() > 1:
			sheets[i].position += diff * delta * 6
		else:
			sheets[i].position = new_sheet_pos
		

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if (event.position.x >= global_position.x + -width / 2 and event.position.x < global_position.x + width / 2) and \
			(event.position.y - global_position.y >= -height / 2 and event.position.y - global_position.y < height / 2):
			var val = (event.position.x - global_position.x) / (width / 2) * sheet_count / 2 + sheet_count / 2
			val = ceil(val + 0.01)
			selected = val - 1
		else:
			selected = -1
		
