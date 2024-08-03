extends Node

class_name GameHandler

var m_player
var m_hud
var m_map

var m_disableMovement = false

var m_staticObjects = {}

var m_textBoxExists = false
var m_yesNo = false

var m_commandProcessor

func _init():
	m_commandProcessor = CommandProcessor.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.dialogue_ended.connect(deactivateTextBox)
	m_player = self.get_node("Player")
	m_hud = self.get_node("HUD")
	m_map = self.get_node("Map")
	var objectContainer = self.get_node("Objects")
	var objectChildren = objectContainer.get_children()
	for child in objectChildren:
		m_staticObjects[child.name] = child

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("key_semicolon"):
		if m_hud.isActive():
			m_hud.setMenuActive(false)
			m_disableMovement = false
		else:
			m_hud.setMenuActive(true)
			m_disableMovement = true
	if !m_player.executingCommand() and !m_commandProcessor.executingCommand():
		if !m_disableMovement:
			if Input.is_action_pressed("key_w"):
				m_player.addCommand(GameCommandMove.new(m_player, DynamicObject.MoveAction.MOVE_FORWARDS))
			elif Input.is_action_pressed("key_q"):
				m_player.addCommand(GameCommandMove.new(m_player, DynamicObject.MoveAction.MOVE_LEFT))
			elif Input.is_action_pressed("key_s"):
				m_player.addCommand(GameCommandMove.new(m_player, DynamicObject.MoveAction.MOVE_BACKWARDS))
			elif Input.is_action_pressed("key_e"):
				m_player.addCommand(GameCommandMove.new(m_player, DynamicObject.MoveAction.MOVE_RIGHT))
			elif Input.is_action_pressed("key_a"):
				m_player.addCommand(GameCommandMove.new(m_player, DynamicObject.MoveAction.TURN_LEFT))
			elif Input.is_action_pressed("key_d"):
				m_player.addCommand(GameCommandMove.new(m_player, DynamicObject.MoveAction.TURN_RIGHT))
			elif Input.is_action_pressed("key_l"):
				scanObjects(m_player.m_posX, m_player.m_posZ)
				#runScript(GameScriptTest.new(self, m_player))
			m_hud.setCoords(m_player.m_posX, 0, m_player.m_posZ)
	m_commandProcessor.processCommand(delta)

func addCommand(command):
	m_commandProcessor.addCommand(command)

func executingCommand():
	return m_commandProcessor.executingCommand()

func setCanMove(canMove):
	m_disableMovement = !canMove

func runScript(script):
	var commands = script.getCommands()
	while !commands.is_empty():
		var command = commands.pop_back()
		command.getActor().addCommand(command)

func scanObjects(x, z):
	var actions = []
	for key in m_staticObjects:
		var object = m_staticObjects[key]
		if object.m_posX == x and object.m_posZ == z:
			if object.hasGameScript():
				actions.push_back(object)
	if len(actions) == 1:
		runScript(actions[0].getGameScript())

func createTextBox(file):
	m_textBoxExists = true
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/" + file + ".dialogue"), "start")

func textBoxActive():
	return m_textBoxExists

func deactivateTextBox(textBox):
	m_textBoxExists = false
