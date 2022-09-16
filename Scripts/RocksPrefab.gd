extends Node2D

var timer = 0

func _process(delta):
	timer += delta
	if timer > 60:
		timer = 0
		self.queue_free()
		
func spawn():
	var children = self.get_children()
	
	var i = 0
	while(i < self.get_child_count()):
		children[i].get_node("Rock").frame  = randi() % 15
		children[i].position += Vector2(randi() % 200 , -randi() % 15)
		children[i].rotation = randi() % 20
		i += 1
