extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0
var time_next_activity = 0
onready var activity: Node = $activity
onready var activities: PoolStringArray = get_files_recursively("res://ghost/activities", "gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	random_activity()

func random_activity():
	activity.set_script(load(activities[randi() % activities.size()]))
	activity._ready()
	activity.set_process(true)
	activity.set_physics_process(true)

func get_files_recursively(path : String, type = []) -> PoolStringArray:
	var files : PoolStringArray = []
	var dir = Directory.new()
	assert( dir.open(path) == OK )
	assert( dir.list_dir_begin(true, true) == OK )

	var next = dir.get_next()
	while !next.empty():
			print(next)
			if dir.current_is_dir():
				files += get_files_recursively("%s/%s" % [dir.get_current_dir(), next], type)
			else:
				var parts = next.rsplit(".", true, 1)
				if type.empty() or (parts.size() == 2 && parts[1] in type):
					files.append("%s/%s" % [dir.get_current_dir(), next])
			next = dir.get_next()

	dir.list_dir_end()
	return files

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#time += delta
	#if time >= time_next_activity:
	#	time = 0
	#	time_next_activity = rand_range(1000, 1000000000)
	#	match (int)rand_range(0, 1):
	#		0:
	#			idle()
	#		1:
	#			move()

func idle():
	pass

func move():
	pass
