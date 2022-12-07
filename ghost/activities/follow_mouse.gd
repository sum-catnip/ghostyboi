extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var ghost: Node2D = get_parent()
var mouse: Vector2

const SMOOTH_SPEED = 2
var repos = Vector2()
var repos_velo = Vector2()
var position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	print('follow')
	print(print_debug(ghost))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mpos = get_viewport().get_mouse_position()#.get_mouse_pos()
	var destination = ghost.position

	repos.x = mpos.x - destination.x
	repos.y = mpos.y - destination.y
	repos_velo.x = repos.x * SMOOTH_SPEED * delta
	repos_velo.y = repos.y * SMOOTH_SPEED * delta

	position.x += repos_velo.x
	position.y += repos_velo.y

	ghost.translate(repos_velo)
	print(mpos)
	
	#mouse = get_viewport().get_mouse_position()
	#ghost.set_position(mouse)
