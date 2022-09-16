extends Area2D

var timer = 0
var speed = 1
export var lifetime = 5.0

func _ready():
	self.get_node("AnimatedSprite").frame = Globals.laser
	self.get_node("Laser Sound").play()

func _process(delta):
	speed -= 2
	self.position += Vector2(-150 + speed, 0) * delta
	timer += delta
	if timer >= lifetime:
		self.queue_free()

func _on_Laser_1_body_shape_entered(_body_id, body, _body_shape, _local_shape):
	if body.name == "Laser 1" ||  body.name == "Laser 2":
		print(body.name)
	else:
		get_tree().get_root().get_node("Space/ExplodeParticleEffect").global_position = body.global_position
		body.queue_free()
		get_tree().get_root().get_node("Space/ExplodeParticleEffect").emitting = true
		Globals.points += 10
		self.queue_free()

func _on_Laser_2_body_shape_entered(_body_id, body, _body_shape, _local_shape):
	if body.name == "Laser 1" ||  body.name == "Laser 2":
		print(body.name)
	else:
		get_tree().get_root().get_node("Space/ExplodeParticleEffect2").global_position = body.global_position
		body.queue_free()
		get_tree().get_root().get_node("Space/ExplodeParticleEffect2").emitting = true
		Globals.points += 10
		self.queue_free()
