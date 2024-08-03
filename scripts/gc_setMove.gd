extends GameCommand

class_name GameCommandSetMove

var m_canMove

func _init(actor, canMove):
	m_actor = actor
	m_canMove = canMove

func start():
	m_actor.setCanMove(m_canMove)

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
