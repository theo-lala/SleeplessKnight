extends Button

var next_scene_path= "res://NewLevel/Game.tscn"


func _on_button_up():
	SignalBus.score = 0
	get_tree().change_scene_to_file(next_scene_path)
	
