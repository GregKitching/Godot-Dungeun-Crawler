extends GameScript

class_name GameScriptChest

var m_gameHandler = null
var m_chest = null

func _init(gameHandler, chest):
	m_gameHandler = gameHandler
	m_chest = chest

func getCommands():
	var commands = []
	commands.push_front(GameCommandTextBox.new(m_gameHandler, ["Chest"]))
	commands.push_front(GameCommandSynchronize.new(null, [m_gameHandler]))
	commands.push_front(GameCommandConditionalSkipImmediate.new(null, [1, [m_gameHandler, "getYesNo"], false, GameCommandConditionalSkip.Condition.EQUAL]))
	commands.push_front(GameCommandCallFunc.new(m_gameHandler, [m_chest, "open"]))
	commands.push_front(GameCommandEnd.new(null, []))
	return commands
