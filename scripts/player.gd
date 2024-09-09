extends DynamicObject

class_name Player

var m_hud

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	#m_hud = self.get_node("../HUD")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
	#pass
