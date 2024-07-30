extends GameScript

# Called when the node enters the scene tree for the first time.
func _ready():
	addStep(Commands.COMMAND_SET_ALL_MOVEMENT, [false])
	addStep(Commands.COMMAND_LOAD_DIALOGUE, ["Chest"])
	addStep(Commands.COMMAND_SET_ALL_MOVEMENT, [true])
	"""var string = JSON.stringify(self)
	var file = FileAccess.open("res://GameScripts/example_chest.txt", FileAccess.WRITE)
	file.store_string(string)"""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
