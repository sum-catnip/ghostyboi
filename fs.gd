extends Node

func get_files_recursively(path : String, type = []) -> PoolStringArray:
	var files : PoolStringArray = []
	var dir = Directory.new()
	assert(dir.open(path) == OK)
	assert(dir.list_dir_begin(true, true) == OK)

	var next = dir.get_next()
	while !next.empty():
			if dir.current_is_dir():
				files += get_files_recursively("%s/%s" % [dir.get_current_dir(), next], type)
			else:
				var parts = next.rsplit(".", true, 1)
				if type.empty() or (parts.size() == 2 && parts[1] in type):
					files.append("%s/%s" % [dir.get_current_dir(), next])
			next = dir.get_next()

	dir.list_dir_end()
	return files
