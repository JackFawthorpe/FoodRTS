class_name BuyMenu
extends Menu

@onready var sell_order_grid = $Background/MenuContainer/HeaderDivision/Children/SelectedSellOrderSplitter/SellOrderGrid

var SellOrderGridItemScene: PackedScene = preload("res://user_interface/buy_menu/SellOrderGridItem.tscn")

## Override of Menu.handle_open to generate the contents of the menu before it is visible
func handle_open():
	Logger.info("Opening Buy Menu", "BuyMenu")
	var orders: Array[SellOrder] = SupplierManager.get_all_sell_orders()
	for order in orders:
		var sell_order_grid_item = SellOrderGridItemScene.instantiate().with(order)
		sell_order_grid_item.sell_order_clicked.connect(_on_sell_order_clicked)
		sell_order_grid.add_child(
			sell_order_grid_item
		)

## Ran when one of the SellOrderGridItem's is clicked, it will open the selected sell order menu
func _on_sell_order_clicked(sell_order: SellOrder):
	Logger.info("Sell Order clicked %s" % sell_order, "BuyMenu")
	var selected_order_container = $Background/MenuContainer/HeaderDivision/Children/SelectedSellOrderSplitter/SelectedSellOrderContainer
	selected_order_container.open_sell_order(sell_order)
	
