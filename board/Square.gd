extends Area2D

export(NodePath) var occupant
var grid_x
var grid_y


func _ready():
	
	grid_x = floor(position.x / 64)
	grid_y = floor(position.y / 64)
	
	if occupant:
		get_node(occupant).position = position
