extends CanvasLayer

var m_active = false
var m_label
var m_container

enum HUD_Action{CONFIRM, CANCEL, MOVE_UP, MOVE_DOWN, MOVE_LEFT, MOVE_RIGHT}

func _ready():
	m_active = false
	m_label = self.get_node("Control/Label")
	m_container = self.get_node("Control/VBoxContainer")
	setMenuActive(false)

func hudAction(action):
	match action:
		HUD_Action.CONFIRM:
			pass
		HUD_Action.CANCEL:
			pass

func setMenuActive(active):
	m_active = active
	m_container.visible = active

func setCoords(x, y, z):
	m_label.text = "\n    X: " + str(x) + ", Y: " + str(y) + ", Z: " + str(z)

func isActive():
	return m_active
