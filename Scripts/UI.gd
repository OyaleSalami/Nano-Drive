extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.get_node("Health Panel/Value").text = String(Globals.health)
	self.get_node("Points Panel/Value").text = String(Globals.points)
