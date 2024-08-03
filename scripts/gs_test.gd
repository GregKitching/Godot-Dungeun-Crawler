extends GameScript

class_name GameScriptTest

func _init(gameHandler, player):
	m_commands.push_front(GameCommandSetMove.new(gameHandler, false))
	m_commands.push_front(GameCommandMove.new(player, DynamicObject.MoveAction.MOVE_FORWARDS))
	m_commands.push_front(GameCommandMove.new(player, DynamicObject.MoveAction.TURN_RIGHT))
	m_commands.push_front(GameCommandMove.new(player, DynamicObject.MoveAction.MOVE_FORWARDS))
	m_commands.push_front(GameCommandMove.new(player, DynamicObject.MoveAction.TURN_RIGHT))
	m_commands.push_front(GameCommandMove.new(player, DynamicObject.MoveAction.MOVE_FORWARDS))
	m_commands.push_front(GameCommandMove.new(player, DynamicObject.MoveAction.TURN_RIGHT))
	m_commands.push_front(GameCommandMove.new(player, DynamicObject.MoveAction.MOVE_FORWARDS))
	m_commands.push_front(GameCommandMove.new(player, DynamicObject.MoveAction.TURN_RIGHT))
	m_commands.push_front(GameCommandSetMove.new(gameHandler, true))
