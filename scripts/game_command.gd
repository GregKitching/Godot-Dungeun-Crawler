class_name GameCommand

var m_actor

var startedExecuting = false
var finishedExecuting = false

func execute(delta):
	if !finishedExecuting:
		if !startedExecuting:
			start()
			startedExecuting = true
		body(delta)
		if endCond():
			end()
			finishedExecuting = true
			return true
	return false

func getActor():
	return m_actor

func start():
	pass

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
