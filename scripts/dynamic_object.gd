extends StaticObject

class_name DynamicObject

enum Direction{NORTH, EAST, SOUTH, WEST}

enum MoveAction{MOVE_FORWARDS, MOVE_BACKWARDS, MOVE_LEFT, MOVE_RIGHT, TURN_LEFT, TURN_RIGHT}

var m_commandProcessor

func _init():
	m_commandProcessor = CommandProcessor.new()

var m_moving = false
var m_direction = Direction.NORTH
var m_movespeed = 2
var m_turnspeed = 3
var m_target_direction
var m_move_args = [
		1.0, # 1.0 = turning left, -1.0 = turning right
		false, # false = x, true = z
		false  # false = decreasing / positive to negative, true = increasing / negative to positive
]

var m_map

var dir_map = {
		Direction.NORTH: Vector2(0, -1),
		Direction.EAST: Vector2(1, 0),
		Direction.SOUTH: Vector2(0, 1),
		Direction.WEST: Vector2(-1, 0)
}

var basis_map = {
		Direction.NORTH: [Vector3(1, 0, 0), Vector3(0, 0, 1)],
		Direction.EAST: [Vector3(0, 0, 1), Vector3(-1, 0, 0)],
		Direction.SOUTH: [Vector3(-1, 0, 0), Vector3(0, 0, -1)],
		Direction.WEST: [Vector3(0, 0, -1), Vector3(1, 0, 0)]
}

func addCommand(command):
	m_commandProcessor.addCommand(command)

func executingCommand():
	return m_commandProcessor.executingCommand()

func can_move(dir):
	var tile = m_map.get_tile(self.transform.origin.x, -self.transform.origin.z)
	if tile != null:
		match dir:
			Direction.NORTH:
				return !tile.has_child("Wall_N")
			Direction.EAST:
				return !tile.has_child("Wall_E")
			Direction.SOUTH:
				return !tile.has_child("Wall_S")
			Direction.WEST:
				return !tile.has_child("Wall_W")

func move_action(action):
	match action:
		MoveAction.MOVE_FORWARDS:
			match m_direction:
				Direction.NORTH:
					if can_move(Direction.NORTH):
						m_moving = true
						m_posZ -= 1
						m_move_args = [-1.0, true, false]
				Direction.EAST:
					if can_move(Direction.EAST):
						m_moving = true
						m_posX += 1
						m_move_args = [1.0, false, true]
				Direction.SOUTH:
					if can_move(Direction.SOUTH):
						m_moving = true
						m_posZ += 1
						m_move_args = [1.0, true, true]
				Direction.WEST:
					if can_move(Direction.WEST):
						m_moving = true
						m_posX -= 1
						m_move_args = [-1.0, false, false]
		MoveAction.MOVE_BACKWARDS:
			match m_direction:
				Direction.NORTH:
					if can_move(Direction.SOUTH):
						m_moving = true
						m_posZ += 1
						m_move_args = [1.0, true, true]
				Direction.EAST:
					if can_move(Direction.WEST):
						m_moving = true
						m_posX -= 1
						m_move_args = [-1.0, false, false]
				Direction.SOUTH:
					if can_move(Direction.NORTH):
						m_moving = true
						m_posZ -= 1
						m_move_args = [-1.0, true, false]
				Direction.WEST:
					if can_move(Direction.EAST):
						m_moving = true
						m_posX += 1
						m_move_args = [1.0, false, true]
		MoveAction.MOVE_LEFT:
			match m_direction:
				Direction.NORTH:
					if can_move(Direction.WEST):
						m_moving = true
						m_posX -= 1
						m_move_args = [-1.0, false, false]
				Direction.EAST:
					if can_move(Direction.NORTH):
						m_moving = true
						m_posZ -= 1
						m_move_args = [-1.0, true, false]
				Direction.SOUTH:
					if can_move(Direction.EAST):
						m_moving = true
						m_posX += 1
						m_move_args = [1.0, false, true]
				Direction.WEST:
					if can_move(Direction.SOUTH):
						m_moving = true
						m_posZ += 1
						m_move_args = [1.0, true, true]
		MoveAction.MOVE_RIGHT:
			match m_direction:
				Direction.NORTH:
					if can_move(Direction.EAST):
						m_moving = true
						m_posX += 1
						m_move_args = [1.0, false, true]
				Direction.EAST:
					if can_move(Direction.SOUTH):
						m_moving = true
						m_posZ += 1
						m_move_args = [1.0, true, true]
				Direction.SOUTH:
					if can_move(Direction.WEST):
						m_moving = true
						m_posX -= 1
						m_move_args = [-1.0, false, false]
				Direction.WEST:
					if can_move(Direction.NORTH):
						m_moving = true
						m_posZ -= 1
						m_move_args = [-1.0, true, false]
		MoveAction.TURN_LEFT:
			m_moving = true
			match m_direction:
				Direction.NORTH:
					m_target_direction = Direction.WEST
					m_move_args = [1.0, false, false]
				Direction.EAST:
					m_target_direction = Direction.NORTH
					m_move_args = [1.0, true, false]
				Direction.SOUTH:
					m_target_direction = Direction.EAST
					m_move_args = [1.0, false, true]
				Direction.WEST:
					m_target_direction = Direction.SOUTH
					m_move_args = [1.0, true, true]
		MoveAction.TURN_RIGHT:
			m_moving = true
			match m_direction:
				Direction.NORTH:
					m_target_direction = Direction.EAST
					m_move_args = [-1.0, false, false]
				Direction.EAST:
					m_target_direction = Direction.SOUTH
					m_move_args = [-1.0, true, false]
				Direction.SOUTH:
					m_target_direction = Direction.WEST
					m_move_args = [-1.0, false, true]
				Direction.WEST:
					m_target_direction = Direction.NORTH
					m_move_args = [-1.0, true, true]

func move(delta):
	if m_move_args[1]:
		self.transform.origin.z += m_move_args[0] * m_movespeed * delta
		if m_move_args[2]:
			if self.transform.origin.z >= m_posZ:
				self.transform.origin.z = m_posZ
				return true
		else:
			if self.transform.origin.z <= m_posZ:
				self.transform.origin.z = m_posZ
				return true
	else:
		self.transform.origin.x += m_move_args[0] * m_movespeed * delta
		if m_move_args[2]:
			if self.transform.origin.x >= m_posX:
				self.transform.origin.x = m_posX
				return true
		else:
			if self.transform.origin.x <= m_posX:
				self.transform.origin.x = m_posX
				return true
	return false

func check_stopped_turning():
	var checked_value
	if m_move_args[1]:
		checked_value = self.transform.basis.x.z
	else:
		checked_value = self.transform.basis.x.x
	if m_move_args[2]:
		if checked_value >= 0.0:
			return true
	else:
		if checked_value <= 0.0:
			return true
	return false

func turn(delta):
	self.transform.basis = Basis(Vector3(0, 1, 0), m_move_args[0] * m_turnspeed * delta) * self.transform.basis
	if check_stopped_turning():
		self.transform.basis.x = basis_map[m_target_direction][0]
		self.transform.basis.z = basis_map[m_target_direction][1]
		m_direction = m_target_direction
		return true
	return false

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	m_map = self.get_parent().get_node("Map")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	m_commandProcessor.processCommand(delta)
