extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_child_count():
		var btn = get_child(i)

		btn.pressed.connect(func():
			var main = get_tree().get_root().get_node("Node3D")
			print("CLicked button")
			print(main)
			if main:
				print(main)
				main.go_to_panorama(i)
		)


# Called every frame. 'delta' is the() elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
