extends MarginContainer




func _ready():
	pass


func _on_Options_pressed():
	get_tree().change_scene("res://menus/OptionsMenu.tscn")


func _on_Play_pressed():
	get_tree().change_scene("res://WGame.tscn")
