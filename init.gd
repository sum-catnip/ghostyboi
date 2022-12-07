extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO: cover multiple monitors
	# TODO: exclude clickable entities in passthrough
	# https://github.com/beeznutzdev/godot-click-through-transparent-window/blob/main/src/Scripts/Canvas.gd
	
	var ss: Vector2 = OS.get_screen_size()
	OS.set_window_size(ss - Vector2(1, 1))
	OS.set_window_position(Vector2(0, 0))
	OS.set_window_always_on_top(true)

	OS.set_borderless_window(true)
	OS.set_window_per_pixel_transparency_enabled(true)
	get_tree().get_root().set_transparent_background(true)
	print_debug(get_viewport().size)
	OS.set_window_mouse_passthrough([Vector2(0, 0), Vector2(0, 0)])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
