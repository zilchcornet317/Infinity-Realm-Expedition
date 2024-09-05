extends Node
class_name State

# Set by enclosing state machine on its ready()
var entity: Entity

# check if a new state should be transitioned to
# returns: the new state that should be transitioned to next, blank means no transition
func check_transition(delta: float) -> String:
	return ""
	
func update(delta: float):
	pass
	
func physics_update(delta: float):
	pass

func on_enter_state():
	pass
	
func on_exit_state():
	pass
