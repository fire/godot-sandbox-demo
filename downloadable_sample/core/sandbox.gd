extends Sandbox

func _ready() -> void:
	var buffer
	buffer = Sandbox.download_program("hello_world")
	#var fa = FileAccess.open("res://downloadable_sample/hello_world.elf", FileAccess.WRITE)
	#fa.store_buffer(buffer)
	#fa.close()

	load_buffer(buffer)
	print("Program buffer size: %d" % buffer.size())
	print(vmcall("hello_world"))
	print(vmcall("fibonacci", 7))
