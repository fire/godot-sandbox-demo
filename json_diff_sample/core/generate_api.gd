@tool
extends EditorScript

func _run():
	print("Starting API generation...")
	
	# Create sandbox instance with error checking
	var sandbox_scene = Sandbox.new()
	if not sandbox_scene:
		print("ERROR: Failed to create Sandbox instance")
		return
	
	# Generate API with error checking
	var api: String = sandbox_scene.generate_api("cpp")
	if api.is_empty():
		print("ERROR: generate_api returned empty string")
		return
	
	print("API generated successfully, length: ", api.length())
	
	# Ensure directory exists
	var dir = DirAccess.open("res://")
	if not dir.dir_exists("json_diff_sample/json_diff"):
		print("ERROR: Directory json_diff_sample/json_diff does not exist")
		return
	
	# Open file with error checking
	var file: FileAccess = FileAccess.open("res://json_diff_sample/json_diff/generated_api.hpp", FileAccess.WRITE)
	if not file:
		print("ERROR: Failed to open file for writing: ", FileAccess.get_open_error())
		return
	
	# Write to file
	file.store_string(api)
	file.close()
	
	print("API successfully written to generated_api.hpp")
