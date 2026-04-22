extends Node3D

@onready var sphere = $MeshInstance3D

var panoramas = [
	preload("res://crossfit_gym_4k.exr"),
	preload("res://newman_locker_room_4k.exr"),
	preload("res://climbing_gym_4k.exr"),
	preload("res://yoga_room_4k.exr"),
	preload("res://wrestling_gym_4k.exr")
]

var xr_interface: XRInterface

var current_index = 0


func go_to_panorama(i):
	current_index = i
	sphere.get_active_material(0).albedo_texture = panoramas[current_index]

func next_panorama():
	current_index += 1
	if current_index >= panoramas.size():
		current_index = 0

	sphere.get_active_material(0).albedo_texture = panoramas[current_index]

func previous_panorama():
	print(current_index)
	current_index -= 1
	if current_index < 0:
		current_index = panoramas.size()-1
	sphere.get_active_material(0).albedo_texture = panoramas[current_index]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("VR works")
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("Vr not working")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
