extends Node
class_name Movement

# may be modified by states
var speed := 5.0

@onready var character_body: CharacterBody3D = $".."

# May be modified by PlayerInput or AI nodes to change move direction
var direction := Vector2.ZERO

func _physics_process(delta):
	var input_dir = Input.get_vector("left", "right", "forward", "back")

	if direction:
		character_body.velocity.x = direction.x * speed
		character_body.velocity.z = direction.y * speed
	else:
		character_body.velocity.x = move_toward(character_body.velocity.x, 0, speed)
		character_body.velocity.z = move_toward(character_body.velocity.z, 0, speed)
		
	character_body.move_and_slide()
