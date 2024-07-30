extends GameCommand

class_name GameCommandChangeTexture

var m_actor

var m_texture

func _init(actor, texture):
	m_actor = actor
	m_texture = texture

func start():
	m_actor.changeSprite(m_texture)

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
