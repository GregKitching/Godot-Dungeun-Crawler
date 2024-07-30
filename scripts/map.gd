extends Node

const Tile = preload("res://objects/tile.tscn")

var m_children

var m_size_x = 2
var m_size_z = 3

var m_tiles = {}

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

# Called when the node enters the scene tree for the first time.
func _ready():
	m_children = self.get_children()
	for child in m_children:
		if child.name.substr(0, 5) == "Tile_":
			add_tile(child.transform.origin.x, -child.transform.origin.z, child)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
