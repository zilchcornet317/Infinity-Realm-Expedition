extends Area3D
class_name Hurtbox

func _init() -> void:
	# Only receive collisions from layer 2 (mask: 01)
	collision_layer = 0
	collision_mask = 2
	

# if any node (Area3D) that is not a Hitbox is passed, will automatically be null.
func _on_area_entered(hitbox: Hitbox) -> void:
	if not hitbox:
		return
		
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
