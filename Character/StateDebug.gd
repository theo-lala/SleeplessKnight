extends Label

@export var state_machine : StateMachine

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = state_machine.current_state.name
