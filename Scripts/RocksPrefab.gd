extends Node2D

var timer = 0

func _process(delta):
	timer += delta
	if timer > 60:
		timer = 0
		self.queue_free()
		
