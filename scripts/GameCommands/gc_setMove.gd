extends GameCommand

class_name GameCommandSetMove

func start():
	m_actor.setCanMove(m_params[0])

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
