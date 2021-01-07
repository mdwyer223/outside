extends Node

class_name Inventory

var items

func _init():
	items = []

func add_item(item):
	items.append(item)
	
func remove_item(item):
	for i in range(len(items)):
		if item == items[i]:
			items.remove(i)
