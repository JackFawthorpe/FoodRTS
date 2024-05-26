class_name Supplier

var _sell_orders: Array[SellOrder]

# Creates a supplier with a list of sell orders
func _init(sell_orders: Array[SellOrder]):
	_sell_orders = sell_orders

func _to_string():
	return str("Supplier: {SellOrders:", str(_sell_orders), "}")
