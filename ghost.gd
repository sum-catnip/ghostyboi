extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0
var time_next_activity = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time >= time_next_activity:
		time = 0
		time_next_activity = rand_range(1000, 1000000000)
		match (int)rand_range(0, 1):
			0:
				idle()
			1:
				move()

func idle():
	pass

func move():
	pass
