extends GameScript

class_name GameScriptChest

func _init(gameHandler, chest):
	m_commands.push_front(GameCommandTextBox.new(gameHandler, "Chest"))
	m_commands.push_front(GameCommandChangeTexture.new(gameHandler, chest, "chest_open"))
