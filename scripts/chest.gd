extends StaticObject

class_name Chest

var m_opened = false

func getGameScript():
	if m_opened:
		return GameScriptText.new(get_tree().get_root().get_node("MapRoot"), "Chest_Opened")
	else:
		return GameScriptChest.new(get_tree().get_root().get_node("MapRoot"), self)

func hasGameScript():
	return true

func open():
	m_opened = true
	changeSprite("chest_open")

func saveState():
	var data = super.saveState()
	data["m_opened"] = m_opened
	return data

func loadState(data):
	super.loadState(data)
	for key in data:
		if key == "m_opened":
			m_opened = data[key]
			if m_opened:
				changeSprite("chest_open")

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
