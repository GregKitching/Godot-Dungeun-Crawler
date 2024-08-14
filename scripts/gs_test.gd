extends GameScript

class_name GameScriptTest

var m_gameHandler = null
var m_player = null

func _init(gameHandler, player):
	m_gameHandler = gameHandler
	m_player = player

func getCommands():
	var commands = []
	commands.push_front(GameCommandSetMove.new(m_gameHandler, [false]))
	commands.push_front(GameCommandMove.new(m_player, [DynamicObject.MoveAction.MOVE_FORWARDS]))
	commands.push_front(GameCommandMove.new(m_player, [DynamicObject.MoveAction.TURN_RIGHT]))
	commands.push_front(GameCommandMove.new(m_player, [DynamicObject.MoveAction.MOVE_FORWARDS]))
	commands.push_front(GameCommandMove.new(m_player, [DynamicObject.MoveAction.TURN_RIGHT]))
	commands.push_front(GameCommandMove.new(m_player, [DynamicObject.MoveAction.MOVE_FORWARDS]))
	commands.push_front(GameCommandMove.new(m_player, [DynamicObject.MoveAction.TURN_RIGHT]))
	commands.push_front(GameCommandMove.new(m_player, [DynamicObject.MoveAction.MOVE_FORWARDS]))
	commands.push_front(GameCommandMove.new(m_player, [DynamicObject.MoveAction.TURN_RIGHT]))
	commands.push_front(GameCommandSetMove.new(m_gameHandler, [true]))
	return commands
