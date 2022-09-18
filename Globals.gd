extends Node

var health
var points

var total_points = 0

var laser = 0
var timer = 0

var dead
var won

func _ready():
	Start()
	
func Start():
	dead = false
	won = false
	health = 100
	points = 0

func _process(delta):
	if(health > 100):
		health = 100
	
	if(health < 0):
		dead = true
		health = 0
		
	if points > 1000:
		won = true
	
	if dead:
		die()
		timer += delta
		if timer > 2:
			var sce = load("res://Game.tscn")
			var _scene = self.get_tree().change_scene_to(sce)
	
	if won:
		win()
		timer += delta
		if timer > 5:
			var _scene = self.get_tree().change_scene("res://Credits.tscn")
	
func win():
	total_points += points
	points = 0
	#Enable win popup
	
func die():
	total_points += points
	points = 0
	#Enable lose popup
