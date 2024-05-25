class_name FoodPile
extends Node3D

@export var foodData: FoodData
@export_range(0, 100) var quantity: int


func _ready():
	print("Readying")
	var instance = foodData.scene.instantiate()
	add_child(instance)
