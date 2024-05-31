@tool
class_name Room
extends Node3D

# Constants
const FLOOR_WIDTH = 0.2

## The origin point is the lower x, lower z corner of the room
@export var origin_point: Vector2 = Vector2(0, 0):
	get:
		return origin_point
	set(value):
		origin_point = value
		_update()

## Scale of the room in the X direction
@export_range(1, 100) var length: int = 3 :
	get:
		return length
	set(value):
		length = value
		_update()
		
## Scale of the room in the Z direction
@export_range(1, 100) var width: int = 3 :
	get:
		return width
	set(value):
		width = value
		_update()
		
## Scale of the room in the Y direction
@export_range(1, 5) var height: int = 1 :
	get:
		return height
	set(value):
		height = value
		_update()

## Called when a parameter of the room needs to be regenerated
func _update():
	_update_absolute_position()
	_update_floor()

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
	var floor: MeshInstance3D = $Floor
	
	var floor_position = Vector3(
		float(length) / 2,
		- FLOOR_WIDTH / 2, 
		float(width) / 2,
	)
	var floor_scale = Vector3(
		length,
		FLOOR_WIDTH,
		width
	)
	floor.set_scale(floor_scale)
	floor.set_position(floor_position)
