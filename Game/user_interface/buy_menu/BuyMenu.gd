class_name BuyMenu
extends Menu

@onready var sell_order_grid = $Background/MenuContainer/HeaderDivision/Children/SelectedSellOrderSplitter/SellOrderGrid

var SellOrderGridItemScene: PackedScene = preload("res://user_interface/buy_menu/SellOrderGridItem.tscn")

func handle_open():
	var orders: Array[SellOrder] = SupplierManager.get_all_sell_orders()
	for order in orders:
		sell_order_grid.add_child(
			SellOrderGridItemScene.instantiate().with(order)
		)
