class_name GameCommand

var m_actor = null
var m_params = []

var startedExecuting = false
var finishedExecuting = false

func _init(actor, params):
	m_actor = actor
	m_params = params

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
