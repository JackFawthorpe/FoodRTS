class_name SellOrderGridItem
extends Control

signal on_sell_order_clicked(sell_order: SellOrder)

@onready var _icon: TextureRect = $Splitter/FoodIcon
@onready var _food_name_label: Label = $Splitter/SellOrderDescription/FoodName
@onready var _quantity_label: Label = $Splitter/SellOrderDescription/Quantity
@onready var _price_label: Label = $Splitter/SellOrderDescription/Price

var _sell_order: SellOrder

func with(sell_order: SellOrder) -> SellOrderGridItem:
	_sell_order = sell_order
	return self

# Loads the sell order into the grid item, ready for presentation
func _ready():
	if _sell_order:
		load_sell_order()

## Loads the sell order data into the grid item. Requires the use of sell_order prior to usage
func load_sell_order():
	Logger.info("Loading sell order into %s" % self, "SellOrderGridItem")
	_icon.texture = _sell_order.get_food_data().icon
	var food = _sell_order.get_food_data()
	_food_name_label.text = food.name
	_quantity_label.text = str("Quantity: ", _sell_order.get_quantity())
	_price_label.text = str("Price: ", _sell_order.get_sell_price())

## OnClickHandler
func _on_gui_input(event):
	if Utilities.is_left_mouse_click(event):
		on_sell_order_clicked.emit(_sell_order)
