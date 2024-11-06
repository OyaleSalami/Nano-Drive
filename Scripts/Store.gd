extends Control

func _ready():
	ResetMenus()

func SetDisplayText(text):
	get_node("Details Panel/Text").text = text

func DisableAllMenus():
	get_node("Store Menu").visible = false
	get_node("Stations Menu").visible = false
	get_node("Ships Menu").visible = false
	get_node("Cosmetics Menu").visible = false
	get_node("Regions Menu").visible = false

func ResetMenus():
	DisableAllMenus()
	get_node("Store Menu").visible = true
	SetDisplayText("Select An Item")

func _on_Cancel_Select_button_up():
	ResetMenus()

func _on_Stations_Menu_Button_up():
	DisableAllMenus()
	get_node("Stations Menu").visible = true
	SetDisplayText("Unlock A New Station")

func _on_Ships_Menu_Button_up():
	DisableAllMenus()
	get_node("Ships Menu").visible = true
	SetDisplayText("Unlock A New Ship")

func _on_Cosmetics_Menu_Button_up():
	DisableAllMenus()
	get_node("Cosmetics Menu").visible = true
	SetDisplayText("Get A New Look")

func _on_Regions_Menu_Button_up():
	DisableAllMenus()
	get_node("Regions Menu").visible = true
	SetDisplayText("Unlock A New Region")

func _on_Back_Button_up():
	var _scene = self.get_tree().change_scene("res://Scene/Main Menu.tscn")
