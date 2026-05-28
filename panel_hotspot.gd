extends Node3D

@onready var title = $Sprite3D/SubViewport/Control/VBoxContainer/Label
@onready var description = $Sprite3D/SubViewport/Control/VBoxContainer/RichTextLabel
@onready var texture = $Sprite3D/SubViewport/Control/VBoxContainer2/TextureRect
@onready var ray: RayCast3D = get_node("/root/Node3D/XROrigin3D/LeftHand/RayCast3D")
@onready var ray2: RayCast3D = get_node("/root/Node3D/XROrigin3D/RightHand/RayCast3D")
@onready var main_node: Node3D = get_node("/root/Node3D")
@onready var origin_left: XRController3D = get_node("/root/Node3D/XROrigin3D/LeftHand")
@onready var origin_right: XRController3D = get_node("/root/Node3D/XROrigin3D/RightHand")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title.text = Global.galeria_owalna_hotspots[Global.current_hotspot]["title"]
	description.text = Global.galeria_owalna_hotspots[Global.current_hotspot]["description"]
	texture.texture = load(Global.galeria_owalna_hotspots[Global.current_hotspot]["url"])
	var scene = load(Global.panoramas[Global.panorama_index])
	var material = StandardMaterial3D.new()	
	var scene_instante = scene.instantiate()
	material.albedo_texture = scene_instante.get_node("MeshInstance3D").get_active_material(0).albedo_texture
	var material2 = $MeshInstance3D.get_active_material(0)
	material2.albedo_texture = scene_instante.get_node("MeshInstance3D").get_active_material(0).albedo_texture
	print(material)
	print(material2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray2.is_colliding():
		if ray2.get_collider().has_meta("back") and origin_right.is_button_pressed("trigger_click"):
			get_tree().change_scene_to_file(Global.panoramas[Global.panorama_index])
	
