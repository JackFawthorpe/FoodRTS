class_name BuyMenu
extends Menu

@onready var sell_order_grid = $Background/MenuContainer/HeaderDivision/Children/SelectedSellOrderSplitter/SellOrderGrid

var SellOrderGridItemScene: PackedScene = preload("res://user_interface/buy_menu/SellOrderGridItem.tscn")

## Map of a sell_order to its supplier and its index within the suppliers list
var _order_supplier_map = {}

## Override of Menu.handle_open to generate the contents of the menu before it is visible
func handle_open():
	Logger.info("Opening Buy Menu", "BuyMenu")
	var suppliers: Array[Supplier] = SupplierManager.get_suppliers()
	for supplier in suppliers:
		for enumeration in Utilities.enumerate(supplier.get_orders()):
			var idx = enumeration[0]
			var order = enumeration[1]
			_order_supplier_map[order] = [idx, supplier]
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


func _on_selected_sell_order_container_sell_order_bought(event):
	var sell_order = event[0]
	var quantity = event[1]
	Logger.info("Purchasing %d items from sell order %s" % [quantity, sell_order])
	
