extends Button

@export var next_scene_path :String = "res://NewLevel/Game.tscn"

func _on_button_up():
		get_tree().change_scene_to_file(next_scene_path)
