extends Node2D

var leftTarget
var rightTarget

var direction
#true(right), false(left)

func _ready():
	leftTarget = get_node("../LeftTarget")
	rightTarget = get_node("../RightTarget")
	
	self.global_position = leftTarget.global_position
	

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mid = get_node("../Mid")
	if self.global_position.x <= mid.global_position.x:
		self.translate(Vector2(0, 5 * delta))
	
	
	if global_position.x <= leftTarget.global_position.x:
		direction = true
	
	if global_position.x >= rightTarget.global_position.x:
		direction = false
	
	if direction == true:
		self.translate(Vector2(14 * delta, 0))
	
	if direction == false:
		self.translate(Vector2(-14 * delta, 0))
