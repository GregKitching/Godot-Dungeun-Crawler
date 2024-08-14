class_name GameScriptRunner

var m_commandQueue = []
var m_commandQueueStack = []

var m_currentCommand = null

var m_running = false
var m_halted = false

func loadScript(script):
	if m_running and !m_commandQueue.is_empty():
		m_commandQueueStack.push_back(m_commandQueue.duplicate())
		m_commandQueue = []
	else:
		m_running = true
	m_commandQueue = script.getCommands()

func runScript(times):
	if m_running:
		for i in range(times):
			if m_currentCommand != null:
				if m_currentCommand is GameCommandEnd:
					m_commandQueue.clear()
					m_currentCommand = null
				elif m_currentCommand is GameCommandSkip:
					var skipNum = m_currentCommand.m_params[0]
					for j in range(skipNum):
						m_commandQueue.pop_back()
						m_currentCommand = null
				elif m_currentCommand is GameCommandConditionalSkip:
					var skip = false
					if m_currentCommand.m_params[3] == GameCommandConditionalSkip.Condition.EQUAL:
						skip = m_currentCommand.m_params[1][0].call(m_currentCommand.m_params[1][1]) == m_currentCommand.m_params[2][0].call(m_currentCommand.m_params[2][1])
					elif m_currentCommand.m_params[3] == GameCommandConditionalSkip.Condition.NOT_EQUAL:
						skip = m_currentCommand.m_params[1][0].call(m_currentCommand.m_params[1][1]) != m_currentCommand.m_params[2][0].call(m_currentCommand.m_params[2][1])
					elif m_currentCommand.m_params[3] == GameCommandConditionalSkip.Condition.LESS_THAN:
						skip = m_currentCommand.m_params[1][0].call(m_currentCommand.m_params[1][1]) < m_currentCommand.m_params[2][0].call(m_currentCommand.m_params[2][1])
					elif m_currentCommand.m_params[3] == GameCommandConditionalSkip.Condition.LESS_THAN_OR_EQUAL:
						skip = m_currentCommand.m_params[1][0].call(m_currentCommand.m_params[1][1]) <= m_currentCommand.m_params[2][0].call(m_currentCommand.m_params[2][1])
					elif m_currentCommand.m_params[3] == GameCommandConditionalSkip.Condition.GREATER_THAN:
						skip = m_currentCommand.m_params[1][0].call(m_currentCommand.m_params[1][1]) > m_currentCommand.m_params[2][0].call(m_currentCommand.m_params[2][1])
					elif m_currentCommand.m_params[3] == GameCommandConditionalSkip.Condition.GREATER_THAN_OR_EQUAL:
						skip = m_currentCommand.m_params[1][0].call(m_currentCommand.m_params[1][1]) >= m_currentCommand.m_params[2][0].call(m_currentCommand.m_params[2][1])
					if skip:
						var skipNum = m_currentCommand.m_params[0]
						for j in range(skipNum):
							m_commandQueue.pop_back()
					m_currentCommand = null
				elif m_currentCommand is GameCommandSynchronize:
					m_halted = true
					var unhalt = true
					for j in range(len(m_currentCommand.m_params)):
						unhalt = unhalt and !m_currentCommand.m_params[j].executingCommand()
					if unhalt:
						m_halted = false
						m_currentCommand = null
					else:
						return
				elif m_currentCommand is GameCommandRunScript:
					loadScript(m_currentCommand.m_params[0])
					m_currentCommand = null
				else:
					m_currentCommand.m_actor.addCommand(m_currentCommand)
					m_currentCommand = null
			if m_currentCommand == null and !m_halted:
				if m_commandQueue.is_empty():
					if m_commandQueueStack.is_empty():
						m_running = false
						return
					else:
						m_commandQueue = m_commandQueueStack.pop_back()
				m_currentCommand = m_commandQueue.pop_back()

func isRunningScript():
	return m_running
