extends Node

onready var native = preload("res://native.gdns").new()

onready var ghost: Node2D = get_parent()
onready var sprite: Node2D = ghost.get_node('sprite')

const SMOOTH_SPEED = 2
var repos = Vector2()
var repos_velo = Vector2()
var position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mpos = native.cursor_pos()
	mpos += Vector2(25, -25)
	var destination = ghost.position

	repos.x = mpos.x - destination.x
	repos.y = mpos.y - destination.y
	repos_velo.x = repos.x * SMOOTH_SPEED * delta
	repos_velo.y = repos.y * SMOOTH_SPEED * delta

	position.x += repos_velo.x
	position.y += repos_velo.y

	ghost.translate(repos_velo)
	if abs(repos_velo.x) >= SMOOTH_SPEED:
		sprite.play('move')
		sprite.set_flip_h(repos_velo.x < 0)
	else:
		sprite.play('idle')

func _exit():
	sprite.play('idle')
