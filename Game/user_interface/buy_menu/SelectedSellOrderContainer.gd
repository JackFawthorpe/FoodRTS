class_name SelectedSellOrderContainer
extends MarginContainer

func open_sell_order(sell_order: SellOrder):
	self.visible = true
	var sell_order_item = $VBoxContainer/SellOrder
	sell_order_item.with(sell_order).load_sell_order()
	

func close():
	self.visible = false
