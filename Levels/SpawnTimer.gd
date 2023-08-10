extends Timer

var enemy = preload("res://Character/Enemies/Ghost/ghost.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var instance = enemy.instantiate()
	
	$Path2D/PathFollow2D.set_progress(rng.randf_range(0,500))
	
	instance.global_position = $Path2D/PathFollow2D/Position2D.global_position
	add_child(instance)
