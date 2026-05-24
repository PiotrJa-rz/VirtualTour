extends Area3D
@onready var ray = $"../XROrigin3D/LeftHand/RayCast3D"
@onready var origin_left: XRController3D = get_node("/root/Node3D/XROrigin3D/LeftHand")
@onready var origin_right: XRController3D = get_node("/root/Node3D/XROrigin3D/RightHand")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var changing_scene = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if changing_scene:
		return 
	if (ray.is_colliding() and Global.button_pressed_on_map):
		print("helolo")
		var suffix = ".tscn"
		var prefix = "res://pomieszczenia-sceny/%s.tscn"
		var scene_name = prefix % "galeria_owalna_2"
		print(name)
		print("Hogw")
		get_tree().change_scene_to_file(scene_name)
		changing_scene = true
