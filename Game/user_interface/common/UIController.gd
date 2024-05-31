class_name UIController
extends Control

var menu_stack: Array[Menu] = []

enum MENUS {
   	BUY_FOOD
}

var menus = {
	MENUS.BUY_FOOD : preload("res://user_interface/buy_menu/BuyMenu.tscn")
}

# Handler for hot key menu opening
func _input(event):
	if event.is_action_pressed("Close Menu") and menu_stack.size() > 0:
		close_menu(menu_stack[-1])
	elif event.is_action_pressed("Open Buy Screen"):
		print("Opening Buy Screen")
		_open_menu(MENUS.BUY_FOOD)
		
# Opens the provided menu
func _open_menu(to_open: MENUS):
	var menu: Menu = menus[to_open].instantiate()
	menu_stack.push_back(menu)
	add_child(menu)
	menu.handle_open()

# Checks if the provided menu is within the menu stack and closes the menu
func close_menu(menu: Menu):
	print("Closing Menu")
	menu_stack.erase(menu)
	menu.queue_free()
