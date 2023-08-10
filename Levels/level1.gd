extends Node2D

@export var enemy_scene: PackedScene
@export var ghost: Ghost
@export var damageable: Damageable
@export var ui: UI
var score

func _ready():
	$MobTimer.start()

func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var enemy = enemy_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to a random location.
	enemy.position = mob_spawn_location.position


	# Spawn the mob by adding it to the Main scene.
	add_child(enemy)
