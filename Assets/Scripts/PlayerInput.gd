extends GenericInput
class_name PlayerInput

@onready var camera: Node3D = get_viewport().get_camera_3d()

func _physics_process(delta):
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var forward = Vector3(input_dir.x, 0, input_dir.y).rotated(Vector3.UP, camera.global_rotation.y)
	direction = Vector2(forward.x, forward.z).normalized()
