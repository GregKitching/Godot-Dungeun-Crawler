extends Node

class_name Tile

var m_floor
var m_ceiling

var m_wall_n
var m_wall_e
var m_wall_s
var m_wall_w

var m_pillar_ne
var m_pillar_se
var m_pillar_sw
var m_pillar_nw

var m_children

func has_child(string):
	return m_children.has(string)

func getChild(childName):
	if m_children.has(childName):
		return m_children[childName]
	return null

# Called when the node enters the scene tree for the first time.
func _ready():
	m_children = {}
	var childList = get_children()
	#print(str(self.transform.origin.x) + ", " + str(-self.transform.origin.z))
	for child in childList:
		m_children[child.name] = child
		#print(child.name)
	#print("\n")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
