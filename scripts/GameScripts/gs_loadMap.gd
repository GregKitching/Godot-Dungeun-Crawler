extends GameScript

class_name GameScriptLoadMap

var m_gameHandler = null
var m_mapName
var m_x
var m_z
var m_direction

func _init(gameHandler, mapName, x, z, direction):
	m_gameHandler = gameHandler
	m_mapName = mapName
	m_x = x
	m_z = z
	m_direction = direction

func getCommands():
	var commands = []
	commands.push_front(GameCommandSaveMapState.new(m_gameHandler, [m_gameHandler.m_map]))
	commands.push_front(GameCommandLoadMap.new(m_gameHandler, [m_mapName, m_x, m_z, m_direction]))
	commands.push_front(GameCommandEnd.new(null, []))
	return commands
