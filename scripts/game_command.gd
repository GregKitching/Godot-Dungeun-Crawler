class_name GameCommand

var startExecuted = false
var finishedExecuted = false

func execute(delta):
	if !finishedExecuted:
		if !startExecuted:
			start()
			startExecuted = true
		body(delta)
		if endCond():
			end()
			finishedExecuted = true
			return true
	return false

func start():
	pass

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
