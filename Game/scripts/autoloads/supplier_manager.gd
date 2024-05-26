extends Node

var _suppliers: Array[Supplier] = []

const SUPPLIER_COUNT: int = 5

# Sell Order Generation Configuration
const MAX_QUANTITY = 10
const MAX_PRICE = 10

# Generates a sell order to be passed to a supplier
func _get_new_sell_order():
	var food: FoodData = FoodResourceManager.get_random_food()
	var quantity: int = randi() % MAX_QUANTITY
	var sell_price: int = randi() % MAX_PRICE
	return SellOrder.new(food, quantity, sell_price)

# Prints a list of all the foods available from the food manager
func _ready():
	for idx in range(SUPPLIER_COUNT):
		var sell_order = _get_new_sell_order()
		_suppliers.append(Supplier.new([sell_order]))
	print("Created %d suppliers" % _suppliers.size())
	for supplier in _suppliers:
		print(supplier)
