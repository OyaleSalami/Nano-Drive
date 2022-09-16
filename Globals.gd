extends Node

var health
var points

var total_points = 0

var laser = 0

func _ready():
	Start()
	
func Start():
	health = 100
	points = 0

func _process(_delta):
	if(health > 100):
		health = 100
	
	if(health < 0):
		health = 0
		die()

func win():
	total_points += points
	points = 0
	
func die():
	total_points += points
	points = 0
