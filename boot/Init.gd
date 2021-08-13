extends Node

func init_settings():
	var fp = File.new()
	var uri = "user://settings.txt"
	if !fp.file_exists(uri):
		fp.open(uri, File.WRITE)
		fp.store_string("0;0;-1")
		fp.close()

func load_skip_intro():
	var fp = File.new()
	var uri = "user://settings.txt"
	fp.open(uri, File.READ)
	var txt = fp.get_as_text()
	fp.close()
	var settings = txt.split(";")
	return settings[1] == "1"

func _ready():
	init_settings()
	var skip_intro = load_skip_intro()
	if skip_intro:
		get_tree().change_scene("res://menus/MainMenu.tscn")
	else:
		get_tree().change_scene("res://boot/Pre1b.tscn")
