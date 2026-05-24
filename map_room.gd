extends Area3D
@onready var ray = $"../XROrigin3D/LeftHand/RayCast3D"
@onready var origin_left: XRController3D = get_node("/root/Node3D/XROrigin3D/LeftHand")
@onready var origin_right: XRController3D = get_node("/root/Node3D/XROrigin3D/RightHand")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var changing_scene = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
