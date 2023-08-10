extends State

@export var return_state : State
@export var attack_name : String = "attack"
@export var return_animation_node : String  = "move"
@export var attack_animation : String = "attack"

@onready var timer : Timer = $Timer


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == attack_name):
		next_state = return_state
		playback.travel(return_animation_node)
		


