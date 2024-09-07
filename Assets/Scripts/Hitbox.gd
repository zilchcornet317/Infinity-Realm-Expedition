extends Area3D
class_name Hitbox

@export var damage := 10

func _init() -> void:
	# Only send collisions to hurtboxes, which have mask of 01
	collision_layer = 2
	collision_mask = 0
