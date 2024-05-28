class_name Supplier

var _sell_orders: Array[SellOrder]

# Creates a supplier with a list of sell orders
func _init(sell_orders: Array[SellOrder]):
	_sell_orders = sell_orders

# Returns all the sell orders the supplier is currently offering
func get_orders() -> Array[SellOrder]:
	return _sell_orders

func _to_string():
	return str("Supplier: {SellOrders:", str(_sell_orders), "}")
