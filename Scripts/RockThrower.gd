extends Node2D

var timer = 0
var rocks
var rocks_instance

func _ready():
	rocks = load("res://Prefabs/RocksPrefab.tscn")

func throw():
	rocks_instance = rocks.instance()
	add_child(rocks_instance)
	
	var children = rocks_instance.get_children()
	var i = 0
	while(i < rocks_instance.get_child_count()):
		children[i].get_node("Rock").frame  = randi() % 15
		children[i].global_position += Vector2(rand_range(-750, 500) , rand_range(-10, -20))
		i += 1

func _process(delta):
	timer += delta
	if timer > 4:
		timer = 0
		throw()
