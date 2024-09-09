extends StaticObject

class_name MapLoader

@export var m_mapName: String
@export var m_x: int
@export var m_z: int
@export var m_direction: DynamicObject.Direction

func getGameScript():
	return GameScriptLoadMap.new(get_tree().get_root().get_node("MapRoot"), m_mapName, m_x, m_z, m_direction)

func hasGameScript():
	return true

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
