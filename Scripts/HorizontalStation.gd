extends AnimatedSprite

var norm = 1
export var speed = 20

func _process(delta):
	if self.position.x >= 1000:
		frame = randi() % 5
		self.position.y += randi() % 20
		norm = -1
	elif self.position.x <= -1000:
		frame = randi() % 5
		self.position.y -= randi() % 20
		norm = 1
	else:
		norm = norm
		
	self.position += Vector2(speed,0) * norm * delta
