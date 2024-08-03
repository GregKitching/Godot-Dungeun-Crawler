extends GameCommand

class_name GameCommandChangeTexture

var m_object
var m_texture

func _init(actor, object, texture):
	m_actor = actor
	m_object = object
	m_texture = texture

func start():
	m_object.changeSprite(m_texture)

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
