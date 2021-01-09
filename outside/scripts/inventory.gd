extends Node

class_name Inventory

var items

func set_up():
	items = []

func add_item(added_item):
	var curr_item_name
	var item_in_inventory = false
	var added_item_name = added_item.get_item_name()
	
	for item in items:
		curr_item_name = item.get_item_name()
		if curr_item_name == added_item_name:
			var leftover = item.add_to_stack_count(added_item.get_stack_count())
			item_in_inventory = true
				
	if not item_in_inventory:
		items.append(added_item)
	
	print(items)
	
func remove_item(removed_item):
	var removed_item_name = removed_item.get_item_name()
	for item in items:
		if item.get_item_name() == removed_item_name:
			item.remove_from_stack_count(removed_item.get_stack_count())
		
		if not item.has_stack():
			items.erase(item)

func get_item_count():
	pass
		
	
