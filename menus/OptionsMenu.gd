extends Control


var do_replace
var skip_intro
var hi_score


func load_settings():
	var uri = "user://settings.txt"
	var fp = File.new()
	fp.open(uri, File.READ)
	var txt = fp.get_as_text()
	fp.close()
	var vals = txt.split_floats(";")
	do_replace = bool(vals[0])
	skip_intro = bool(vals[1])
	hi_score = int(vals[2])

func set_settings():
	$Replacer.pressed = do_replace
	$SkipIntro.pressed = skip_intro

func save_settings():
	var a
	var b
	var c
	if do_replace:
		a = "1"
	else:
		a = "0"
	if skip_intro:
		b = "1"
	else:
		b = "0"
	if hi_score > -1:
		c = str(hi_score)
	else:
		c = "-1"
	var txt = a + ";" + b + ";" + c
	var fp = File.new()
	var uri = "user://settings.txt"
	fp.open(uri, File.WRITE)
	fp.store_string(txt)
	fp.close()

func _ready():
	load_settings()
	set_settings()


func _on_Back_pressed():
	get_tree().change_scene("res://menus/MainMenu.tscn")


func _on_Replacer_toggled(button_pressed):
	do_replace = !do_replace
	save_settings()


func _on_SkipIntro_toggled(button_pressed):
	skip_intro = !skip_intro
	save_settings()


func _on_ClearScore_pressed():
	hi_score = -1
	save_settings()
