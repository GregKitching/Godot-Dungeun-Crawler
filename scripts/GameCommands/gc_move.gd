extends GameCommand

class_name GameCommandMove

var m_doneMoving = false

func start():
	m_actor.move_action(m_params[0])

func body(delta):
	if m_params[0] == DynamicObject.MoveAction.TURN_LEFT or m_params[0] == DynamicObject.MoveAction.TURN_RIGHT:
		m_doneMoving = m_actor.turn(delta)
	else:
		m_doneMoving = m_actor.move(delta)

func end():
	pass

func endCond():
	return m_doneMoving
