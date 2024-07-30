extends Node

class_name StaticObject

var m_meshInstance3D
var m_posX = 0
var m_posZ = 0
var m_gameScript = null
@export var m_solid: bool
@export var m_interactableN: bool
@export var m_interactableS: bool
@export var m_interactableE: bool
@export var m_interactableW: bool
@export var m_triggerOnEnter: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	m_meshInstance3D = self.get_node("MeshInstance3D")
	m_posX = self.transform.origin.x
	m_posZ = self.transform.origin.z

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(delta)
	pass

func changeSprite(sprite):
	m_meshInstance3D.material_override = load("res://textures/" + sprite + ".tres")

func getGameScript():
	return m_gameScript

func hasGameScript():
	return m_gameScript != null
