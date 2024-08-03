extends GameCommand

class_name GameCommandMove

var m_direction = null

var m_doneMoving = false

func _init(actor, direction):
	m_actor = actor
	m_direction = direction

func start():
	m_actor.move_action(m_direction)

func body(delta):
	if m_direction == DynamicObject.MoveAction.TURN_LEFT or m_direction == DynamicObject.MoveAction.TURN_RIGHT:
		m_doneMoving = m_actor.turn(delta)
	else:
		m_doneMoving = m_actor.move(delta)

func end():
	pass

func endCond():
	return m_doneMoving
