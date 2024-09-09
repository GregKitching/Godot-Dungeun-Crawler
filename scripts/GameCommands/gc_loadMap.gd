extends GameCommand

class_name GameCommandLoadMap

func start():
	m_actor.loadMap(m_params[0], m_params[1], m_params[2], m_params[3])

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
