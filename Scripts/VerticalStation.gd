extends AnimatedSprite

var norm = 1

func _process(delta):
	if self.position.y >= 1600:
		frame = randi() % 4
		self.position.x += randi() % 5
		norm = -1
	elif self.position.y <= -300:
		frame = randi() % 4
		self.position.x -= randi() % 5
		norm = 1
	else:
		norm = norm
		
	self.position += Vector2(0,50) * norm * delta
