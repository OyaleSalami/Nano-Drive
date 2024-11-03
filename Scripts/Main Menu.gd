extends Control

var index = 0 #Shows the selected mode
var modes = ["Play", "Settings", "Store", "Exit"]

func _ready():
	UpdateUI()

func UpdateUI():
	self.get_node("Mode Panel/Mode Select Button").text = modes[index]

func _on_Left_button_up():
	if (index - 1) < 0:
		return
	index -= 1
	UpdateUI()

func _on_Right_button_up():
	if (index + 1) >= modes.size():
		return
	index += 1
	UpdateUI()

func _on_Mode_Select_button_up():
	if(modes[index] == "Exit"):
		self.get_tree().quit()
		return
		
	var scene = "res://Scene/" + modes[index] + ".tscn"
	var _nextscene = get_tree().change_scene(scene)

#Toggle between credits and menu
func _on_Info_button_up():
	var menu = get_node("Mode Panel").visible
	var credits = get_node("Credits Panel").visible
	if(menu == credits):
		printerr("Both of these panels should not be active at the same time!")
	
	get_node("Mode Panel").visible = !menu
	get_node("Credits Panel").visible = !credits


