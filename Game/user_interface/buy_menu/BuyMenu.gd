class_name BuyMenu
extends Menu

@onready var sell_order_grid = $Background/MenuContainer/HeaderDivision/Children/SelectedSellOrderSplitter/VBoxContainer/SellOrderGrid
@onready var player_money_label = $Background/MenuContainer/HeaderDivision/Children/SelectedSellOrderSplitter/VBoxContainer/PlayerMoneyLabel

var SellOrderGridItemScene: PackedScene = preload("res://user_interface/buy_menu/SellOrderGridItem.tscn")

## Map of a sell_order to its supplier and its index within the suppliers list
var _order_supplier_map = {}

func _ready():
	EconomyManager.on_player_money_update.connect(_on_player_money_update)

func _on_player_money_update(player_money):
	player_money_label.text = "Player Money: %d" % player_money

## Override of Menu.handle_open to generate the contents of the menu before it is visible
func handle_open():
	Logger.info("Opening Buy Menu", "BuyMenu")
	
	player_money_label.text = "Player Money: %d" % EconomyManager.player_money
	
	var suppliers: Array[Supplier] = SupplierManager.get_suppliers()
	for supplier in suppliers:
		for enumeration in Utilities.enumerate(supplier.get_orders()):
			var idx = enumeration[0]
			var order = enumeration[1]
			_order_supplier_map[order] = [idx, supplier]
			var sell_order_grid_item = SellOrderGridItemScene.instantiate().with(order)
			sell_order_grid_item.on_sell_order_clicked.connect(_on_sell_order_clicked)
			sell_order_grid.add_child(
				sell_order_grid_item
			)

## Ran when one of the SellOrderGridItem's is clicked, it will open the selected sell order menu
func _on_sell_order_clicked(sell_order: SellOrder):
	Logger.info("Sell Order clicked %s" % sell_order, "BuyMenu")
	var selected_order_container = $Background/MenuContainer/HeaderDivision/Children/SelectedSellOrderSplitter/SelectedSellOrderContainer
	selected_order_container.open_sell_order(sell_order)

## Ran when something has been purchased
func _on_sell_order_bought(sell_order: SellOrder, quantity: int):
	var cost = sell_order.get_sell_price() * quantity
	EconomyManager.change_player_money(-cost)
	var selected_order_container = $Background/MenuContainer/HeaderDivision/Children/SelectedSellOrderSplitter/SelectedSellOrderContainer
	selected_order_container.close()
	Logger.info("Purchased %d items from sell order %s" % [quantity, sell_order])
