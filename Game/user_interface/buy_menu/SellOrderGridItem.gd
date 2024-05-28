class_name SellOrderGridItem
extends Control

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
	_icon.texture = _sell_order.get_food_data().icon
	var food = _sell_order.get_food_data()
	_food_name_label.text = food.name
	_quantity_label.text = str("Quantity: ", _sell_order.get_quantity())
	_price_label.text = str("Price: ", _sell_order.get_sell_price())
