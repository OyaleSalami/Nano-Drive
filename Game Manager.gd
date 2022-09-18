extends Control

func _ready():
	pass # Replace with function body.

var interval = 20
var timer = 0

func _process(delta):
	timer += delta
	if timer > interval:
		var line = load("res://Prefabs/Enemy Line.tscn").instance()
		self.add_child(line)
		timer = 0
