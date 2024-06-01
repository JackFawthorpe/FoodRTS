class_name SelectedSellOrderContainer
extends MarginContainer

## Signal that passes [sell_order_bought, quantity_purchased]
signal sell_order_bought

var _current_sell_order

func open_sell_order(sell_order: SellOrder):
	Logger.info("Loading %s into the selected item", "SelectedSellOrderContainer")
	self.visible = true
	_current_sell_order = sell_order
	var sell_order_item = $VBoxContainer/SellOrder
	sell_order_item.with(_current_sell_order).load_sell_order()
	

func close():
	self.visible = false

## Handles the confirmation of purchased
func _on_buy():
	print(_current_sell_order)
	sell_order_bought.emit([_current_sell_order, 5])
	close()
