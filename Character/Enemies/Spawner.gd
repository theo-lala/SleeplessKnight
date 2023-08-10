extends Marker2D

@export var enemy_scene: PackedScene


func spawn():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	
	return enemy
	
func spawn_again():
	
	var enemy = spawn()
	
	var x_offset = randf_range(0.0, 50)
	
	enemy.position = Vector2(x_offset, 5)
	return enemy


func _on_timer_timeout():
	spawn_again()
