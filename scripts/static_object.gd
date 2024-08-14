extends Node

class_name StaticObject

var m_meshInstance3D
var m_posX = 0
var m_posZ = 0
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
	pass

func changeSprite(sprite):
	m_meshInstance3D.material_override = load("res://textures/" + sprite + ".tres")
	m_meshInstance3D.material_override.set_billboard_mode(BaseMaterial3D.BILLBOARD_FIXED_Y)
	m_meshInstance3D.material_override.set_flag(BaseMaterial3D.FLAG_BILLBOARD_KEEP_SCALE, true)

func hasGameScript():
	return false
