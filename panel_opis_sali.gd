extends Node3D

@onready var title = $Sprite3D/SubViewport/Control/VBoxContainer/Label
@onready var description = $Sprite3D/SubViewport/Control/VBoxContainer/RichTextLabel
@onready var ray: RayCast3D = get_node("/root/Node3D/XROrigin3D/LeftHand/RayCast3D")
@onready var ray2: RayCast3D = get_node("/root/Node3D/XROrigin3D/RightHand/RayCast3D")
@onready var main_node: Node3D = get_node("/root/Node3D")
@onready var origin_left: XRController3D = get_node("/root/Node3D/XROrigin3D/LeftHand")
@onready var origin_right: XRController3D = get_node("/root/Node3D/XROrigin3D/RightHand")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.panorama_index < 3:
		title.text = Global.opisy_sal["owalna"]["title"]
		description.text = Global.opisy_sal["owalna"]["description"]
	elif Global.panorama_index >= 3 and Global.panorama_index < 5:
		title.text = Global.opisy_sal["rady"]["title"]
		description.text = Global.opisy_sal["rady"]["description"]
	elif Global.panorama_index >= 5 and Global.panorama_index < 8:
		title.text = Global.opisy_sal["wielka"]["title"]
		description.text = Global.opisy_sal["wielka"]["description"]
	elif Global.panorama_index >= 8 and Global.panorama_index < 11:
		title.text = Global.opisy_sal["rycerska"]["title"]
		description.text = Global.opisy_sal["rycerska"]["description"]
	elif Global.panorama_index >= 11 and Global.panorama_index < 13:
		title.text = Global.opisy_sal["tronowa"]["title"]
		description.text = Global.opisy_sal["tronowa"]["description"]
	elif Global.panorama_index == 13:
		title.text = Global.opisy_sal["marmurowy"]["title"]
		description.text = Global.opisy_sal["marmurowy"]["description"]
	elif Global.panorama_index > 13 and Global.panorama_index < 16:
		title.text = Global.opisy_sal["przedpokoj"]["title"]
		description.text = Global.opisy_sal["przedpokoj"]["description"]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray2.is_colliding():
		if ray2.get_collider().has_meta("back") and origin_right.is_button_pressed("trigger_click"):
			get_tree().change_scene_to_file(Global.panoramas[Global.panorama_index])
