extends Control

var index = 0
var sections = ["Sector 52", "Sector 68", "Alyxixs", "Allopsys 28", "Shango 47", "Ogun 24", "Jos 13"]

# Called when the node enters the scene tree for the first time.
func _ready():
	show_section(index)

func show_section(number):
	var i = 0
	while i < sections.size():
		self.get_node("HSplitContainer/Panel/Sections").get_children()[i].hide()
		i += 1
	self.get_node("HSplitContainer/Panel/Sections/" + String(number)).show()
	self.get_node("HSplitContainer/Panel/Mode").text = sections[index]

func _on_Mode_button_down():
	var _scene = self.get_tree().change_scene("res://Main.tscn")

func _on_Right_Button_down():
	if (index + 1) >= sections.size():
		show_section(index)
		return
	index += 1
	show_section(index)
		
func _on_Left_Button_down():
	if (index - 1) < 0:
		show_section(index)
		return
	index -= 1
	show_section(index)
