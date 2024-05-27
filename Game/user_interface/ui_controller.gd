extends Control

var menu_stack: Array[Control] = []

enum MENUS {
   	BUY_FOOD
}

var menus = {
	MENUS.BUY_FOOD : preload("res://user_interface/menus/market_menu.tscn")
}

# Handler for hot key menu opening
func _input(event):
	if event.is_action_pressed("Close Menu"):
		print("Closing most recent menu")
		_close_menu()
	elif event.is_action_pressed("Open Buy Screen"):
		print("Opening Buy Screen")
		_open_menu(MENUS.BUY_FOOD)
		
# Opens the provided menu
func _open_menu(to_open: MENUS):
	var menu = menus[to_open].instantiate()
	menu_stack.push_back(menu)
	add_child(menu)

# Closes the most recent menu
func _close_menu():
	var to_close = menu_stack.pop_back()
	if to_close:
		to_close.queue_free()
