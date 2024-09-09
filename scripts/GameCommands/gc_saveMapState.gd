extends GameCommand

class_name GameCommandSaveMapState

func start():
	m_params[0].saveState()

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
