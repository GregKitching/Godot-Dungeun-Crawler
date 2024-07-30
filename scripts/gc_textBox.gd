extends GameCommand

class_name GameCommandTextBox

var m_inputHandler

var m_file

func _init(inputHandler, file):
	m_inputHandler = inputHandler
	m_file = file

func start():
	m_inputHandler.createTextBox(m_file)

func body(delta):
	pass

func end():
	pass

func endCond():
	return !m_inputHandler.textBoxActive()
