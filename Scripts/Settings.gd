extends Control

func _ready():
	LoadDefaultValues()

func _on_Left_Button_down():
	var _scene = self.get_tree().change_scene("res://Scene/Main Menu.tscn")

func LoadDefaultValues():
	var music = Globals.music
	var sfx = Globals.sfx
	
	get_node("Settings Panel/VSplitContainer/SfxButton").pressed = sfx
	get_node("Settings Panel/VSplitContainer/MusicButton").pressed = music

func _on_SfxButton_toggled(button_pressed):
	Globals.sfx = button_pressed

func _on_MusicButton_toggled(button_pressed):
	Globals.music = button_pressed
