extends XRController3D

@onready var main_node = get_node("/root/Node3D")
@onready var controls = $"../Camera3D/Node3D"
@onready var ray: RayCast3D = $"RayCast3D"


func _on_button_pressed(button_name):
	if button_name =="trigger_click" and Global.map:
		Global.button_pressed_on_map = true
		if ray.is_colliding():
			var prefix = "res://pomieszczenia-sceny/%s.tscn"
			var scene_name = prefix % ray.get_collider().name.to_lower()
			var i = 0
			for panorama in Global.panoramas:
				if panorama == scene_name:
					Global.panorama_index = i
				i+=1
			get_tree().change_scene_to_file.bind(scene_name).call_deferred()
			Global.button_pressed_on_map = false
			Global.map = false
	if button_name == "trigger_click":
		Global.next_panorama()
	elif button_name == "grip_click":
		Global.previous_panorama()
	elif button_name == "menu_button":
		Global.panel_visible = !Global.panel_visible
		controls.visible = Global.panel_visible
	elif Global.map and button_name == "ax_button":
		Global.go_to_panorama(Global.panorama_index)
		Global.map = false
	elif button_name == "ax_button": 
		Global.map = true
		get_tree().change_scene_to_file.bind("res://panel_mapy.tscn").call_deferred()
	elif button_name == "by_button":
		get_tree().change_scene_to_file.bind("res://panel_opis_sali.tscn").call_deferred()
		Global.opis_sali = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_pressed.connect(_on_button_pressed)
	controls.visible = Global.panel_visible


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
