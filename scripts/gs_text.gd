extends GameScript

class_name GameScriptText

var m_gameHandler = null
var m_dialogue = null

func _init(gameHandler, dialogue):
	m_gameHandler = gameHandler
	m_dialogue = dialogue

func getCommands():
	var commands = []
	commands.push_front(GameCommandTextBox.new(m_gameHandler, [m_dialogue]))
	return commands
