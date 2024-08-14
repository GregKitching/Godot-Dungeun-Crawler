extends StaticObject

class_name Test0

func getGameScript():
	return GameScriptTest.new(get_tree().get_root().get_node("MapRoot"), get_tree().get_root().get_node("MapRoot").get_node("Player"))

func hasGameScript():
	return true

# Called when the node enters the scene tree for the first time.
func _ready():
	#m_gameScript = GameScriptTest.new(get_tree().get_root().get_node("MapRoot"), get_tree().get_root().get_node("MapRoot").get_node("Player"))
	super._ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
