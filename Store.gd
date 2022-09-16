extends Control

var index = 0
var items = ["Station 1", "Station 2", "Statiion 3", "Laser 1", "Laser 2"]

func _ready():
	show_item(index)

func show_item(number):
	var i = 0
	
	while i < items.size():
		self.get_node("Panel/Sections").get_children()[i].hide()
		i += 1
		
	self.get_node("Panel/Sections").get_children()[number].show()
	self.get_node("Panel/Head").text = "1000 points (" + items[number] + ") "

func _on_Unlock_button_down():
	if Globals.total_points > 1000:
		Globals.total_points -= 1000
		self.get_node("Panel/Head").text = "Owned"

func _on_Right_Button_down():
	if (index + 1) >= items.size():
		show_item(index)
		return
	index += 1
	show_item(index)

func _on_Left_Button_down():
	if (index - 1) < 0:
		show_item(index)
		return
	index -= 1
	show_item(index)

func _on_Back_button_down():
	var _scene = self.get_tree().change_scene("res://Game.tscn")
