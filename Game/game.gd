extends Node2D

var platform = preload('res://Game/Platforms/NormalPad.tscn')
var width 


# Called when the node enters the scene tree for the first time.
func _ready():
	width = get_viewport_rect().size.x
	var y = 0
	randomize()
	print(width)
	while y > -3000:
		var new_platform = platform.instantiate()
		new_platform.position = Vector2(randf_range(-width/2, width/2), y)
		add_child(new_platform)
		y -= randf_range(0, 210)
