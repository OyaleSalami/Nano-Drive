extends Node2D

var timer = 0
var speed = 1
var explosion
export var lifetime = 7.0

func _ready():
	self.get_node("1/AnimatedSprite").frame = Globals.laser
	self.get_node("2/AnimatedSprite").frame = Globals.laser
	self.get_node("Laser Sound").play()
	explosion = load("res://Prefabs/Explosion.tscn")

func _process(delta):
	speed += 2
	self.position += Vector2(0, 150 + speed) * delta
	timer += delta
	if timer >= lifetime:
		self.queue_free()


func _on_1_area_entered(area):
	print(area.name)
	if area.name == "1" || area.name == "2":
		return
	if area.name == "Ship Body":
		self.get_parent().add_child(explosion.instance())
		self.queue_free()

func _on_2_area_entered(area):
	if area.name == "1" || area.name == "2":
		return
	if area.name == "Ship Body":
		self.get_parent().add_child(explosion.instance())
		self.queue_free()
		
