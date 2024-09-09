extends CanvasLayer

var m_active = false
var m_mapCoordsLabel
var m_playerInfoLabel
var m_container

enum HUD_Action{CONFIRM, CANCEL, MOVE_UP, MOVE_DOWN, MOVE_LEFT, MOVE_RIGHT}

func _ready():
	m_active = false
	m_mapCoordsLabel = self.get_node("Control/MapCoords")
	m_playerInfoLabel = self.get_node("Control/PlayerInfo")
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
	m_mapCoordsLabel.text = "X: " + str(x) + ", Y: " + str(y) + ", Z: " + str(z)

func setPlayerInfo(playerCharacter):
	m_playerInfoLabel.text = playerCharacter.m_characterBase.m_name + "\nHP: " + str(playerCharacter.m_maxHp) + "/" + str(playerCharacter.m_hp) + " MP: " + str(playerCharacter.m_maxMp) + "/" + str(playerCharacter.m_mp)

func isActive():
	return m_active
