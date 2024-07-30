class_name Character

var m_max_hp
var m_max_mp
var m_attack
var m_defence
var m_magic_attack
var m_magic_defence
var m_speed

var m_hp
var m_mp

func _init(_hp, _mp, _a, _d, _ma, _md, _s):
	m_max_hp = _hp
	m_max_mp = _mp
	m_attack = _a
	m_defence = _d
	m_magic_attack = _ma
	m_magic_defence = _md
	m_speed = _s
	m_hp = m_max_hp
	m_mp = m_max_mp
