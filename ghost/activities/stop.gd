extends Node

onready var ghost: Node2D = get_parent()
onready var sprite: Node2D = ghost.get_node('sprite')

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play('idle')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
