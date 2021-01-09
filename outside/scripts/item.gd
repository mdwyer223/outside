extends Node

class_name Item

var MAX_STACK = 10

var stack_count
var weight
var item_name

func set_up(iname, count):
	item_name = iname
	stack_count = count
	
func add_to_stack_count(count):
	stack_count += count
	var leftover = stack_count - MAX_STACK
	if leftover > 0:
		stack_count = MAX_STACK
	
	return leftover
	
func remove_from_stack_count(count):
	stack_count -= count
	if stack_count < 0:
		stack_count = 0
		
	return stack_count
	
func get_item_name():
	return item_name
	
func has_stack():
	if stack_count <= 0:
		return false
	return true

func get_stack_count():
	return stack_count

func _to_string():
	return item_name + ":" + str(stack_count)
	
