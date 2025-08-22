extends Sandbox

func _ready() -> void:
	var program_buffer: PackedByteArray = download_program("hello_world")
	print("Program buffer size: %d" % program_buffer.size())
	load_buffer(program_buffer)
	print("Hello world: %s" % vmcall("hello_world"))
	print("Hello world: %s" % vmcall("fibonacci", 256))
