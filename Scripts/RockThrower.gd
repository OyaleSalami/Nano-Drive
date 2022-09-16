extends Node2D

var timer = 0
var rocks
var rocks_instance
var aim = false

func _ready():
	rocks = load("res://Prefabs/RocksPrefab.tscn")

func throw():
	rocks_instance = rocks.instance()
	add_child(rocks_instance)

func _process(delta):
	timer += delta
	if timer > 4:
		timer = 0
		throw()
