extends Node



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(SignalBus.score >= 100):
		get_tree().change_scene_to_file("res://Screens/FinalScreen.tscn")


