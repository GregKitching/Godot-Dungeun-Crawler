extends GameCommand

class_name GameCommandConditionalSkip
# Metacommand to skip a number of commands in the command queue to skip if a certain condition is met
# params: [number of commands to skip, variable 1, variable 2, condition]

enum Condition{EQUAL, NOT_EQUAL, LESS_THAN, LESS_THAN_OR_EQUAL, GREATER_THAN, GREATER_THAN_OR_EQUAL}

func start():
	pass

func body(delta):
	pass

func end():
	pass

func endCond():
	return true
