extends GameCommand

class_name GameCommandTextBox

var m_file

func _init(actor, file):
	m_actor = actor
	m_file = file

func start():
	m_actor.createTextBox(m_file)

func body(delta):
	pass

func end():
	pass

func endCond():
	return !m_actor.textBoxActive()
