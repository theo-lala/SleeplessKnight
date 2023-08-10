extends Node

class_name StateMachine 

@export var current_state : State
@export var next_state : State
@export var character : CharacterBody2D
@export var animation_tree : AnimationTree
@export var spawn_animation_node : String = "spawn"

var states : Array[State]

func _ready():
	for child in get_children():
		if(child is State):
			states.append(child)
			
			# Set the states up with what they need to function
			child.character = character
			child.playback = animation_tree["parameters/playback"]
			
			#connect to interupt signal 
			child.connect("interrupt_state", on_state_interrupt_state)
			
		else:
			push_warning("Child " + child.name + " is not a State for CharacterStateMachine")

func _physics_process(delta):
	if(current_state.next_state != null):
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)

func check_if_can_move():
	return current_state.can_move


func switch_states(new_state : State):
	if(current_state != null):
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = new_state
	
	current_state.on_enter()

func _input(event : InputEvent):
	current_state.state_input(event)
	
func on_state_interrupt_state(new_state : State):
	switch_states(new_state)



func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == spawn_animation_node):
		#character is finished dying, vanish
		switch_states(next_state)
