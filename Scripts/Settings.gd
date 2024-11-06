extends Control

func _ready():
	LoadDefaultValues()

func _process(_delta):
	
	pass

func LoadDefaultValues():
	get_node("Settings Panel/VSplitContainer/SfxButton").pressed = Globals.sfx
	get_node("Settings Panel/VSplitContainer/MusicButton").pressed = Globals.music

func _on_SfxButton_toggled(button_pressed):
	Globals.sfx = button_pressed

func _on_MusicButton_toggled(button_pressed):
	Globals.music = button_pressed

func _on_Back_Button_down():
	var _scene = self.get_tree().change_scene("res://Scene/Main Menu.tscn")
