extends Node
class_name StateMachine

var current_state : State

# Called when the node enters the scene tree for the first time.
func _ready():
	# if this is a part of an entity, store ref here
	var entity = get_node_or_null("..")
	if not entity:
		print_debug("no entity in statemachine parent: "+name)
	
	for state in get_children():
		if state is State:
			# if statemachine is part of an entity, store it here
			if entity: state.entity = entity
			# make sure all inactive states are not being processed
			state.set_process(false)
		else:
			print_debug("Child node %s in state machine %s is not a state!" % [state.name, name])
	


func _process(delta):
	if not current_state:
		current_state = get_child(0)
		print("switched to initial state "+current_state.name)
		current_state.set_process(true)
		current_state.on_enter_state()
	
	var next_state_name = current_state.check_transition(delta)
	if next_state_name:
		switch_to(next_state_name)
		
	current_state.update(delta)
		
	# after this, all inactive states will be disabled
	# and only the active one will have inherit (pausable)

func _physics_process(delta):
	if (current_state): current_state.physics_update(delta)

# switch to the new state. Will look for a child node with the given name (path).
func switch_to(state: String):
	# make sure inactive states are not being processed
	current_state.on_exit_state()
	current_state.set_process(false)
	
	current_state = get_node(state)
	if !current_state:
		print_debug("state %s does not exist" % state)
		
	current_state.set_process(true)
	current_state.on_enter_state()
	
	print("state changed to "+current_state.name)
