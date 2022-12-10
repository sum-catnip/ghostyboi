extends Node2D

var time = 0
var time_next_activity
onready var fs = preload("res://fs.gd").new()
onready var activity: Node = $activity
onready var activities: PoolStringArray = fs.get_files_recursively("res://ghost/activities", "gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	random_activity()

func random_activity():
	#time_next_activity = rand_range(5, 60 * 30)
	time_next_activity = 3
	var activity_new = activities[randi() % activities.size()]
	print("entering activity: %s for %d seconds" % [activity_new, time_next_activity])
	if(activity and activity.has_method("_exit")): activity._exit()
	activity.set_script(load(activity_new))
	activity._ready()
	activity.set_process(true)
	activity.set_physics_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time >= time_next_activity:
		random_activity()
		time = 0
