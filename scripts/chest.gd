extends StaticObject

class_name Chest

#const tex = preload("res://textures/chest_open.tres")

var m_opened = false

# Called when the node enters the scene tree for the first time.
func _ready():
	m_gameScript = GameScriptChest.new(get_tree().get_root().get_node("test"), self)
	super._ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
