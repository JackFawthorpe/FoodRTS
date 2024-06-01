@tool
class_name Room
extends Node3D

# Constants
const BOX_THICKNESS = 0.2

@export_group("Wall Visibility")
@export var show_west_wall: bool = false :
	set(value):
		show_west_wall = value
		_update()
@export var show_north_wall: bool = false :
	set(value):
		show_north_wall = value
		_update()
@export var show_east_wall: bool = false :
	set(value):
		show_east_wall = value
		_update()
@export var show_south_wall: bool = false :
	set(value):
		show_south_wall = value
		_update()


@export_group("Room Positioning")
## The origin point is the lower x, lower z corner of the room
@export var origin_point: Vector2 = Vector2(0, 0):
	set(value):
		origin_point = value
		_update()

## Scale of the room in the X direction
@export_range(1, 100) var length: int = 3 :
	set(value):
		length = value
		_update()
		
## Scale of the room in the Z direction
@export_range(1, 100) var width: int = 3 :
	set(value):
		width = value
		_update()
		
## Scale of the room in the Y direction
@export_range(1, 5) var height: int = 1 :
	set(value):
		height = value
		_update()

var _is_ready: bool = false

func _ready():
	_is_ready = true
	_update()

## Called when a parameter of the room needs to be regenerated
func _update():
	Logger.info("Updating Room Layout", "Room")
	if !_is_ready:
		return
	_update_absolute_position()
	_update_floor()
	_update_walls()

## Updates the position of the room
func _update_absolute_position():
	var room_position = Vector3(
		origin_point.x, 
		0, 
		origin_point.y
	)
	self.position = room_position

## Recalculates the scale and position of the floor with respect to the room
func _update_floor():
	Logger.info("Updating room floor", "Room")
	var floor_mesh: MeshInstance3D = $Floor
	
	var floor_position = Vector3(
		float(length) / 2,
		- BOX_THICKNESS / 2, 
		float(width) / 2,
	)
	var floor_scale = Vector3(
		length,
		BOX_THICKNESS,
		width
	)
	floor_mesh.set_scale(floor_scale)
	floor_mesh.set_position(floor_position)

## Generates the wall nodes
func _generate_walls(wall_visibility):
	Logger.info("Generating new walls", "Room")
	var walls = []
	for idx in range(wall_visibility.size()):
		# Dont generate the wall if its not visible
		if !wall_visibility[idx]:
			walls.append(null)
			continue
		
		# Is North or south
		var is_polar_wall = idx % 2 == 1
		var wall_scale
		
		if is_polar_wall:
			wall_scale = Vector3(
				BOX_THICKNESS,
				height,
				width
			)
		else:
			wall_scale = Vector3(
				length,
				height,
				BOX_THICKNESS
			)
		var wall = MeshInstance3D.new()
		wall.mesh = BoxMesh.new()
		wall.set_scale(wall_scale)
		walls.append(wall)
	return walls

## Moves the walls to the correct position within the room
func _position_walls(walls, wall_visibility):
	Logger.info("Updating room's wall positioning", "Room")
	for idx in range(wall_visibility.size()):
		if !wall_visibility[idx]:
			continue
		var wall_position
		match idx:
			0: # WEST
				wall_position = Vector3(
					length / 2.0,
					height / 2.0,
					- BOX_THICKNESS / 2.0
				)
			1: # NORTH
				wall_position = Vector3(
					length + BOX_THICKNESS /  2.0,
					height /  2.0,
					width /  2.0
				)
			2: # EAST
				wall_position = Vector3(
					length / 2.0,
					height / 2.0,
					width + BOX_THICKNESS / 2.0
				)
			3: # SOUTH
				wall_position = Vector3(
					- BOX_THICKNESS / 2.0,
					height /  2.0,
					width /  2.0
				)
		walls[idx].set_position(wall_position)
		

## Handles the regeneration of walls on changes to the room
func _update_walls():
	var wall_container = $WallContainer
	Utilities.free_children(wall_container)
	
	var wall_visibility = [
		show_west_wall,
		show_north_wall,
		show_east_wall,
		show_south_wall
	]
	
	var walls = _generate_walls(wall_visibility)
	_position_walls(walls, wall_visibility)
	for idx in range(wall_visibility.size()):
		if wall_visibility[idx]:
			wall_container.add_child(walls[idx])
