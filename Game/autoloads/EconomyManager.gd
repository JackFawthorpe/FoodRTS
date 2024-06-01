extends Node

const DEFAULT_PLAYER_MONEY = 100

signal on_player_money_update(new_value)

var player_money: int = DEFAULT_PLAYER_MONEY :
	get:
		return player_money

## Method to update the amount of money that the player has
func change_player_money(value_to_add: int):
	player_money += value_to_add
	Logger.info("Players money updated: %d" % player_money, "EconomyManager")
	on_player_money_update.emit(player_money) 
