extends CPUParticles2D

func _ready():
	emitting = true
	get_node("Explosion Sound").play()

func _process(_delta):
	if emitting == false:
		self.queue_free()
