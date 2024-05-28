class_name SellOrder

@export var _food: FoodData

@export var _quantity: int

@export var _sell_price: int

# Creates a sell order with the provided food, quantity and price
func _init(food: FoodData, quantity: int, sell_price: int):
	_food = food
	_quantity = quantity
	_sell_price = sell_price

func _to_string():
	return str("SellOrder:{Food:", _food.name, ", Quantity:", _quantity, ",SellPrice:", _sell_price, "}")

func get_food_data() -> FoodData:
	return _food
	
func get_quantity() -> int:
	return _quantity
	
func get_sell_price() -> int:
	return _sell_price
