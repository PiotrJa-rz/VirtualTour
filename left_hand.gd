extends XRController3D

@onready var ray = $RayCast3D

var last_trigger = false

@onready var origin = get_tree().get_first_node_in_group("XROrigin3D")
var last_grip = false


func _process(delta):
	var trigger = is_button_pressed("trigger_click")
	var grip = is_button_pressed("grip_click")  # może się nazywać inaczej
	if is_button_pressed("trigger_click"):
		print("TRIGGER")

	if is_button_pressed("primary_click"):
		print("PRIMARY")

	if is_button_pressed("secondary_click"):
		print("SECONDARY")

	if is_button_pressed("grip_click"):
		print("GRIP")

	var main = get_tree().get_root().get_node("Node3D")
	if main == null:
		return

	# 👉 trigger = następna panorama
	if trigger and not last_trigger:
		print("Wykonuje sie!")
		main.next_panorama()

	# 👉 grip = poprzednia panorama
	if grip and not last_grip:
		main.previous_panorama()

	last_trigger = trigger
	last_grip = grip
	var axis = get_vector2("primary")

	if axis.length() > 0.1:

		if origin:
			var camera = origin.get_node("XRCamera3D")

			var dir = Vector3(axis.x, 0, axis.y)
			dir = camera.global_transform.basis * dir
			dir.y = 0
			dir = dir.normalized()

			origin.global_position += dir * 2.0 * delta
