extends Node

const Tile = preload("res://objects/tile.tscn")

var m_mapName

var m_children

var m_tiles = {}
var m_staticObjects = {}
var m_dynamicObjects = {}

func add_tile(x, z, tile):
	if m_tiles.has(x):
		m_tiles[x][z] = tile
	else:
		m_tiles[x] = {z: tile}

func get_tile(x, z):
	if m_tiles.has(x):
		if m_tiles[x].has(z):
			return m_tiles[x][z]
		else:
			print("fail z")
	else:
		print("fail x")
	return null

func scanObjects(x, z, direction):
	var actions = []
	for key in m_staticObjects:
		var object = m_staticObjects[key]
		if object.m_posX == x and object.m_posZ == z:
			if object.hasGameScript():
				if object.m_interactableN and direction == DynamicObject.Direction.NORTH:
					actions.push_back(object)
				elif object.m_interactableS and direction == DynamicObject.Direction.SOUTH:
					actions.push_back(object)
				elif object.m_interactableE and direction == DynamicObject.Direction.EAST:
					actions.push_back(object)
				elif object.m_interactableW and direction == DynamicObject.Direction.WEST:
					actions.push_back(object)
	return actions

func saveState():
	var file = FileAccess.open("user://" + m_mapName + ".dat", FileAccess.WRITE)
	var saveDict = {}
	var staticObjDict = {}
	for key in m_staticObjects:
		staticObjDict[key] = m_staticObjects[key].saveState()
	saveDict["m_staticObjects"] = staticObjDict
	var dynamicObjDict = {}
	for key in m_dynamicObjects:
		dynamicObjDict[key] = m_dynamicObjects[key].saveState()
	saveDict["m_dynamicObjects"] = dynamicObjDict
	file.store_var(saveDict)

func loadState():
	if FileAccess.file_exists("user://" + m_mapName + ".dat"):
		var file = FileAccess.open("user://" + m_mapName + ".dat", FileAccess.READ)
		var saveDict = file.get_var()
		for key in saveDict:
			if key == "m_staticObjects":
				var staticObjDict = saveDict[key]
				for key2 in staticObjDict:
					m_staticObjects[key2].loadState(staticObjDict[key2])
			elif key == "m_dynamicObjects":
				var dynamicObjDict = saveDict[key]
				for key2 in dynamicObjDict:
					m_dynamicObjects[key2].loadState(dynamicObjDict[key2])

# Called when the node enters the scene tree for the first time.
func _ready():
	m_children = self.get_children()
	for child in m_children:
		if child.name.substr(0, 5) == "Tile_":
			add_tile(child.transform.origin.x, -child.transform.origin.z, child)
	var staticObjectContainer = self.get_node("Static_Objects")
	var staticObjectChildren = staticObjectContainer.get_children()
	for child in staticObjectChildren:
		m_staticObjects[child.name] = child
	var dynamicObjectContainer = self.get_node("Dynamic_Objects")
	var dynamicObjectChildren = dynamicObjectContainer.get_children()
	for child in dynamicObjectChildren:
		m_dynamicObjects[child.name] = child

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
