extends Node

onready var ghost: Node2D = get_parent()
onready var sprite: Node2D = ghost.get_node('sprite')
onready var bubble: Node2D = ghost.get_node('bubble')
onready var fs = preload("res://fs.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	bubble.show()
	sprite.play('idle')
	var txts = fs.get_files_recursively("res://ghost/bubble", "png")
	var txt = load(txts[randi() % txts.size()])
	bubble.set_texture(txt)
	#bubble.set_position(ghost.position + Vector2(txt.get_size().x, -50))
	var size = txt.get_size() * bubble.get_scale()
	bubble.set_position(Vector2(-(size.x / 3) + 15, bubble.position.y))

func _exit():
	bubble.hide()
