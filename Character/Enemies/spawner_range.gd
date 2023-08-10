extends "res://Character/Enemies/Spawner.gd"

@export var spawn_range = 100

func _ready():
	spawn()

func spawn():
	get_parent().spawn()
	print(get_parent())

