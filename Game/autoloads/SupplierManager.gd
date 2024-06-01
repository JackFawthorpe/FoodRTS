extends Node

var _suppliers: Array[Supplier] = []

const SUPPLIER_COUNT: int = 5

# Sell Order Generation Configuration
const MAX_QUANTITY = 10
const MAX_PRICE = 10

func get_suppliers():
	return _suppliers

## Generates a list of all the orders that are currently available
func get_all_sell_orders() -> Array[SellOrder]:
	Logger.info("Getting all sell orders", "SupplierManager")
	var orders: Array[SellOrder] = []
	for supplier in _suppliers:
		orders.append_array(supplier.get_orders())
	return orders

## Generates a sell order to be passed to a supplier
func _get_new_sell_order() -> SellOrder:
	Logger.info("Generating a new SellOrder", "SupplierManager")
	var food: FoodData = FoodResourceManager.get_random_food()
	var quantity: int = randi_range(1, MAX_QUANTITY)
	var sell_price: int = randi_range(1, MAX_PRICE)
	return SellOrder.new(food, quantity, sell_price)

## Prints a list of all the foods available from the food manager
func _ready():
	for idx in range(SUPPLIER_COUNT):
		var sell_order = _get_new_sell_order()
		_suppliers.append(Supplier.new([sell_order]))
	Logger.info("Created %d suppliers" % _suppliers.size(), "SupplierManager")
	for supplier in _suppliers:
		Logger.info(supplier, "Supplier Manager")
