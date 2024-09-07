extends State
class_name AttackState

# Name of the animation to play for this attack
@export var attack_name: String

# When attack button is pressed again, once cancel delay is over, this attack is used next in the combo. if empty, same attack is used again.
@export var combos_into: String

# Player can cancel the attack and start a new attack after this many seconds into the attack
@export var cancel_delay: float = 0.1

# Object(s) that should be enabled/disabled when entering/exiting this state. (slash effect)
@export var show_during: Array[Node3D]

func check_transition(delta: float) -> String:
	# go to idle after anim is completely finished
	if anim_finished:
		return "Idle"
		
	# can cancel into move if cancel delay passed
	if not is_in_delay() and entity.movement.is_move_key_just_pressed():
		return "Run"
	
		
	return ""
	
func is_in_delay():
	return time_elapsed < cancel_delay
	
func physics_update(delta: float):
	pass

func on_enter_state():
	for node in show_during:
		node.show()
	
	entity.movement.direction = Vector2.ZERO
	entity.anim.play(attack_name)

func on_exit_state():
	for node in show_during:
		node.hide()
