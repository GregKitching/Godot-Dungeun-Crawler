extends Node

class_name GameHandler

var m_player
var m_hud
var m_map

var m_disableMovement = false

var m_textBoxExists = false
static var m_yesNo = false

var m_commandProcessor
var m_gameScriptRunner

var m_playerCharacter
var m_playerCharacterBase

func _init():
	m_commandProcessor = CommandProcessor.new()
	m_gameScriptRunner = GameScriptRunner.new()
	m_playerCharacterBase = CharacterBase.new("Player", 20, 10, 5, 5, 5, 5, 5)
	m_playerCharacter = Character.new(m_playerCharacterBase)

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.dialogue_ended.connect(deactivateTextBox)
	m_player = self.get_node("Player")
	m_hud = self.get_node("HUD")
	m_hud.setPlayerInfo(m_playerCharacter)
	loadMap("map_test", 0, 0, DynamicObject.Direction.NORTH)

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
				m_player.addCommand(GameCommandMove.new(m_player, [DynamicObject.MoveAction.MOVE_FORWARDS]))
			elif Input.is_action_pressed("key_q"):
				m_player.addCommand(GameCommandMove.new(m_player, [DynamicObject.MoveAction.MOVE_LEFT]))
			elif Input.is_action_pressed("key_s"):
				m_player.addCommand(GameCommandMove.new(m_player, [DynamicObject.MoveAction.MOVE_BACKWARDS]))
			elif Input.is_action_pressed("key_e"):
				m_player.addCommand(GameCommandMove.new(m_player, [DynamicObject.MoveAction.MOVE_RIGHT]))
			elif Input.is_action_pressed("key_a"):
				m_player.addCommand(GameCommandMove.new(m_player, [DynamicObject.MoveAction.TURN_LEFT]))
			elif Input.is_action_pressed("key_d"):
				m_player.addCommand(GameCommandMove.new(m_player, [DynamicObject.MoveAction.TURN_RIGHT]))
			elif Input.is_action_just_pressed("key_l"):
				scanObjects(m_player.m_posX, m_player.m_posZ)
			m_hud.setCoords(m_player.m_posX, 0, m_player.m_posZ)
	m_gameScriptRunner.runScript(2)
	m_commandProcessor.processCommand(delta)

func addCommand(command):
	m_commandProcessor.addCommand(command)

func executingCommand():
	return m_commandProcessor.executingCommand()

func setCanMove(canMove):
	m_disableMovement = !canMove

func runScript(script):
	if !m_gameScriptRunner.isRunningScript():
		m_gameScriptRunner.loadScript(script)

func scanObjects(x, z):
	var actions = m_map.scanObjects(x, z, m_player.m_direction)
	if len(actions) == 1:
		runScript(actions[0].getGameScript())

func createTextBox(file):
	m_textBoxExists = true
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/" + file + ".dialogue"), "start")

func textBoxActive():
	return m_textBoxExists

func deactivateTextBox(textBox):
	m_textBoxExists = false

func callFunc(object, funcName):
	object.call(funcName)

func setYesNo(val):
	m_yesNo = val

func getYesNo():
	return m_yesNo

func dummyReturnTrue():
	return true

func dummyReturnFalse():
	return false

func loadMap(mapName, x, z, direction):
	if m_map:
		self.remove_child(m_map) # Possible issues with dynamic objects still executing commands
		#self.queue_free()
	m_player.setPosition(x, z, direction)
	m_hud.setCoords(m_player.m_posX, 0, m_player.m_posZ)
	var map = load("res://scenes/maps/" + mapName + ".tscn")
	m_map = map.instantiate()
	m_map.m_mapName = mapName
	self.add_child(m_map, true)
	m_map.loadState()

func getMapTile(x, z):
	if m_map:
		return m_map.get_tile(x, z)
	else:
		return null
