extends Node2D

var laser
var timer = 0
var interval = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	laser = load("res://Prefabs/EnemyLaser.tscn")
	interval = (randi() % 20) /10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer > interval:
		shoot()
		interval = (randi() % 20) /10
		timer = 0

func shoot():
	var laser_instance = laser.instance()
	laser_instance.rotation = -laser_instance.rotation
	laser_instance.global_position = get_node("weapon").global_position
	laser_instance.scale = Vector2(0.5, 0.5)
	self.get_parent().get_parent().add_child(laser_instance)
