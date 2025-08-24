extends Label

@onready
var player_node = get_node("%Player")

func _ready() -> void:
	var player_sandbox = player_node.get_script().get_sandbox_for(player_node)
	# Accessing a shared sandbox requires using get_sandbox_for(), which takes a Node instance
	player_sandbox.add_allowed_object(player_node)
	# Now we can access the Sandbox used by Player
	self.text = player_node.get("player_name")

func _process(_delta: float) -> void:
	if self.name == "CallLabel":
		var player_sandbox = player_node.get_script().get_sandbox_for(player_node)
		# Get any sandbox, and ask for the global number of VM calls made
		var total_calls = player_sandbox.get("global_calls_made")
		self.text = "Virtual Machine\nfunction calls: " + str(total_calls)
