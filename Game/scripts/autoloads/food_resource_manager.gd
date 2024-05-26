extends Node

var _food_resource_group: ResourceGroup = preload("res://data/model/foods.tres")

var _foods: Array[FoodData]

# Loads in all of the food resources
func _ready():
	_food_resource_group.load_all_into(_foods)

# Returns a read only version of the food array
func get_foods():
	return _foods.duplicate()

# Returns a random food from all available foods
func get_random_food():
	var idx: int = randi() % _foods.size()
	return _foods[idx].duplicate()
