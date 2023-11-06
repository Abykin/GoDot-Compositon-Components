extends Control

@onready var ability_1 = $"Ability 1"

#TODO Implement tooltip control

func set_ability_bar(cooldown):
	ability_1.max_value = cooldown

func set_ability_bar_value(value):
	ability_1.value = value
