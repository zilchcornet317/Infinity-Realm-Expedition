extends State
class_name IdleState

func check_transition(delta: float) -> String:
	if entity.input.direction != Vector2.ZERO:
		return "Run"
	return ""
	
func physics_update(delta: float):
	pass

func on_enter_state():
	if entity.anim_tree:
		pass
	else:
		#entity.anim.play("Sword-Standby")
		entity.anim.play("Run-Stop")
	entity.movement.direction = Vector2.ZERO
