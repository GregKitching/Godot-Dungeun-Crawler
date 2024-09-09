class_name EnemyAI

var m_parent = null

func _init(parent):
	m_parent = parent

func getCommand():
	var command = null
	if !m_parent.executingCommand():
		if m_parent.can_move(m_parent.m_direction):
			command = GameCommandMove.new(m_parent, [DynamicObject.MoveAction.MOVE_FORWARDS])
		else:
			command = GameCommandMove.new(m_parent, [DynamicObject.MoveAction.TURN_LEFT])
	return command
