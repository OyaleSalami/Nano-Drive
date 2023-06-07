extends Control

var index = 0
var modes = ["Play", "Settings", "Store", "Credits"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.get_node("Mode Panel/Mode Select Button").text = modes[index]

func _on_Right_Button_down():
	if (index + 1) >= modes.size():
		return
	index += 1
		
func _on_Left_Button_down():
	if (index - 1) < 0:
		return
	index -= 1

func _on_Mode_Button_down():
	if(modes[index] == "Exit"):
		self.get_tree().quit()
		return
		
	var scene = "res://Scene/" + modes[index] + ".tscn"
	var _nextscene = get_tree().change_scene(scene)
