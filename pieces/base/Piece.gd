extends Area2D

func _ready():
	#var init_x = grid_x * 64 + 32
	#var init_y = grid_y * 64 + 32
	#position = Vector2(init_x, init_y)
	pass


var being_dragged = false
var original_pos = Vector2()

func save_orig_pos():
	original_pos = position

func restore_orig_pos():
	position = original_pos

func process_press_release(ev):
	being_dragged = !!ev.pressed
	
	if being_dragged: # initial press down
		save_orig_pos()
		
	else: # final lifting up
		
		var new_x = floor(position.x / 64)
		var new_y = floor(position.y / 64)
		
		for n in get_node("..").get_children():
			pass
		#var new_x = grid_x * 64 + 32
		#var new_y = grid_y * 64 + 32
		#position = Vector2(new_x, new_y)
		#restore_orig_pos()

func process_drag(ev):
	if being_dragged:
		position = ev.position


func is_press_release(ev):
	var is_mouse = ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT
	var is_touch = ev is InputEventScreenTouch and ev.get_index() == 0
	return mouseover and (is_mouse or is_touch)

func is_drag(ev):
	return ev is InputEventScreenDrag or ev is InputEventMouseMotion


func _input(event):
	pass
	#if is_press_release(event):
	#	process_press_release(event)
	
	#elif is_drag(event):
	#	process_drag(event)


var mouseover = false

func _on_Piece_mouse_entered():
	mouseover = true

func _on_Piece_mouse_exited():
	mouseover = false
