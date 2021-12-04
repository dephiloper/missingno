extends Node2D

var relations = {}

func _init():
	var file = File.new()
	file.open("traits.json", file.READ)
	var text = file.get_as_text()
	file.close()
	
	var parsed = JSON.parse(text)
	relations = parsed.result
	if parsed.error != 0:
		print("error while parsing traits.json")
		print("error code: ", parsed.error)
		print("error line: ", parsed.error_line)
		print("error string: ", parsed.error_string)
