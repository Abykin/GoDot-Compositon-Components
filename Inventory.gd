extends Node
class_name Inventory

@export var items = []

func add_item(item):
	items.append(item)

func remove_item(item):
	items.erase(item)

func retrieve_item(item_name):
	for item in items:
		if item.name == item_name:
			return item
	return null
