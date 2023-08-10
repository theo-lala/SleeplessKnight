extends CanvasLayer

class_name UI

@onready var score_label = %Score
@onready var SFX_BUS_ID = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS_ID = AudioServer.get_bus_index("Music")
@onready var options_3 = $Control/Options3


func _input(event):
	if event.is_action_pressed("esc"):
		options_3.visible = !options_3.visible
#		get_tree().paused = !get_tree().paused
		



func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS_ID, value < .05)


func _on_sfx_slider_2_value_changed(value):
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_ID, value < .05)
