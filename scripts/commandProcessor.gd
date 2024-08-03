class_name CommandProcessor

var m_commandQueue = []

var m_currentCommand = null

func addCommand(command):
	m_commandQueue.push_front(command)

func executingCommand():
	return m_currentCommand != null

func processCommand(delta):
	if m_currentCommand == null:
		if !m_commandQueue.is_empty():
			m_currentCommand = m_commandQueue.pop_back()
	if m_currentCommand != null:
		if m_currentCommand.execute(delta):
			m_currentCommand = null
