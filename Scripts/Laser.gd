extends Node2D

var timer = 0
var speed = 1
var explosion
var explosion_instance
export var lifetime = 7.0

func _ready():
	explosion = load("res://Prefabs/Explosion.tscn")
	explosion_instance = explosion.instance()
	self.get_node("Laser Sound").play()

func _process(delta):
	speed -= 2
	self.position += Vector2(0, -150 + speed) * delta
	timer += delta
	if timer >= lifetime:
		self.queue_free()


func _on_1_area_entered(area):
	if area.name == "1" || area.name == "2":
		return
	if area.name == "Enemy Body":
		area.get_parent().queue_free()
		explosion_instance.global_position = self.global_position
		self.get_parent().add_child(explosion_instance)
		Globals.points += 10
		self.queue_free()

func _on_2_area_entered(area):
	if area.name == "1" || area.name == "2":
		return
	if area.name == "Enemy Body":
		area.get_parent().queue_free()
		explosion_instance.global_position = self.global_position
		self.get_parent().add_child(explosion_instance)
		Globals.points += 10
		self.queue_free()
		
