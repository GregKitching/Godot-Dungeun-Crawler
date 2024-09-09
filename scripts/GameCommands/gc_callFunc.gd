extends GameCommand

class_name GameCommandCallFunc

func start():
	m_actor.callFunc(m_params[0], m_params[1])

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
