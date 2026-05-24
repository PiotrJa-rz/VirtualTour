extends Area3D

@onready var ray: RayCast3D = get_node("/root/Node3D/XROrigin3D/LeftHand/RayCast3D")
@onready var ray2: RayCast3D = get_node("/root/Node3D/XROrigin3D/RightHand/RayCast3D")
@onready var main_node: Node3D = get_node("/root/Node3D")
@onready var origin_left: XRController3D = get_node("/root/Node3D/XROrigin3D/LeftHand")
@onready var origin_right: XRController3D = get_node("/root/Node3D/XROrigin3D/RightHand")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray2.is_colliding():
		if ray2.get_collider().has_meta("eksponat") and origin_right.is_button_pressed("trigger_click"):
			Global.current_hotspot = ray2.get_collider().name
			get_tree().change_scene_to_file("res://panel_hotspot.tscn")
	
	
