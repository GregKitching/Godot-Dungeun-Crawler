extends GameCommand

class_name GameCommandTextBox

func start():
	m_actor.createTextBox(m_params[0])

func body(delta):
	pass

func end():
	pass

func endCond():
	return !m_actor.textBoxActive()
