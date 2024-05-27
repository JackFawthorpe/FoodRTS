class_name Menu
extends Control

# Asks the controller of the menu to close itself
func _on_close_button_pressed():
	var ui_controller = get_parent()
	if ui_controller is UIController:
		ui_controller.close_menu(self)
