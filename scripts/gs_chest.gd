extends GameScript

class_name GameScriptChest

func _init(scriptHandler, chest):
	m_commandPackets.push_front([GameCommandTextBox.new(scriptHandler, "Chest")])
	m_commandPackets.push_front([GameCommandChangeTexture.new(chest, "chest_open")])
