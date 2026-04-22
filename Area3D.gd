extends Area3D


func on_vr_click():
	var main = get_tree().get_first_node_in_group("Node3D")
	if main:
		get_tree().get_root().get_node("Node3D").next_panorama()

func _input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if get_parent().name == "Arrow_Right":
			get_tree().get_root().get_node("Node3D").next_panorama()
		else:
			get_tree().get_root().get_node("Node3D").previous_panorama()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
