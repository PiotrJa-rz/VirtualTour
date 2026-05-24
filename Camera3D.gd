extends Camera3D

var sensitivity = 0.2
var rotation_x = 0.0
var rotation_y = 0.0


var rotating = false

func _input(event):
	# klik = zaczynamy / kończymy obrót
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			rotating = event.pressed

	# ruch myszy działa tylko gdy trzymasz klik
	if event is InputEventMouseMotion and rotating:
		rotation_y -= event.relative.x * sensitivity
		rotation_x -= event.relative.y * sensitivity
		rotation_x = clamp(rotation_x, -90, 90)

		rotation_degrees = Vector3(rotation_x, rotation_y, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
