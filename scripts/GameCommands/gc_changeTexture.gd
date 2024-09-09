extends GameCommand

class_name GameCommandChangeTexture

func start():
	m_params[0].changeSprite(m_params[1])

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
