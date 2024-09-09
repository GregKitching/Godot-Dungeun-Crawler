class_name Character

var m_characterBase = null

var m_maxHp
var m_maxMp
var m_attack
var m_defence
var m_speed
var m_mAttack
var m_mDefence

var m_hp
var m_mp

func _init(base):
	m_characterBase = base
	
	m_maxHp = m_characterBase.m_baseHp
	m_maxMp = m_characterBase.m_baseMp
	m_attack = m_characterBase.m_strength
	m_defence = m_characterBase.m_constitution
	m_speed = m_characterBase.m_agility
	m_mAttack = m_characterBase.m_intelligence
	m_mDefence = m_characterBase.m_willpower
	
	m_hp = m_maxHp
	m_mp = m_maxMp
