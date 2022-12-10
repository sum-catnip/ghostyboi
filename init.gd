extends Node2D

onready var native = preload("res://native.gdns").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	native._ready()

	var ss: Vector2 = OS.get_screen_size()
	OS.set_window_size(ss - Vector2(1, 1))
	OS.set_window_position(Vector2(0, 0))
	OS.set_window_always_on_top(true)

	OS.set_borderless_window(true)
	OS.set_window_per_pixel_transparency_enabled(true)
	get_tree().get_root().set_transparent_background(true)
	
	var min_i = 0
	var min_x = 0
	var size = Vector2(0, 0)
	for i in range(OS.get_screen_count()):
		var pos_x = OS.get_screen_position(i).x
		size += OS.get_screen_size(i)
		if pos_x < min_x:
			min_i = i
			min_x = pos_x
	
	OS.set_current_screen(min_i)
	OS.set_window_size(size)
	native.window_clickthrough()
