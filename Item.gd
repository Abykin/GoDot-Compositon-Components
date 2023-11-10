extends Node2D
class_name Item

@export var name_item = "Item"
@export var description = "A simple item."

func _init(item_name = "Item", item_description = "A simple item."):
	name = item_name
	description = item_description
