extends KinematicBody2D

var wait_time = 0.35 
var timer = 0

var laser
var explosion
var engine_audio
var finished = true

func _ready():
	laser = load("res://Prefabs/LaserPrefab.tscn")
	explosion = load("res://Prefabs/Explosion.tscn")
	engine_audio = self.get_node("Engine Sound")

func _process(delta):
	timer += delta
	if timer > wait_time:
		if Input.is_action_pressed('Fire'):
			var laser_instance = laser.instance()
			laser_instance.global_position = self.get_node("weapon").global_position
			self.get_parent().add_child(laser_instance)
			timer = 0
	
func _physics_process(delta):
	var speed = 1
	if Input.is_key_pressed(KEY_SHIFT):
		speed = 2
		engine_audio.pitch_scale = 1.75
	else:
		engine_audio.pitch_scale = 1.5
		speed = 1
		
	if Input.is_action_pressed('Up'):
		self.translate(Vector2(0, -150) * delta * speed)
		if finished:
			engine_audio.play()
			finished = false
	if Input.is_action_pressed("Down"):
		self.translate(Vector2(0, 150) * delta * speed)
		if finished:
			engine_audio.play()
			finished = false
	if Input.is_action_pressed("Left"):
		self.translate(Vector2(-150, 0) * delta * speed)
		if finished:
			engine_audio.play()
			finished = false
	if Input.is_action_pressed("Right"):
		self.translate(Vector2(150, 0) * delta * speed)
		if finished:
			engine_audio.play()
			finished = false

func _on_Ship_Body_body_entered(body):
	if body.name == "health":
		Globals.health += 30
		return
		
	var expl = explosion.instance()
	self.get_node("../Explosion Sound").play()
	self.get_parent().get_parent().add_child(expl)
	expl.global_position = body.global_position
	expl.emitting = true
	body.queue_free()
	Globals.health -= 5

func _on_Ship_Body_area_entered(area):
	if (area.name == "1") || (area.name == "2"):
		var expl = load("res://Explosion.tscn").instance()
		expl.global_position = area.global_position
		self.get_parent().add_child(expl)
		Globals.health -= 10
		area.queue_free()

func _on_Engine_Sound_finished():
	finished = true
