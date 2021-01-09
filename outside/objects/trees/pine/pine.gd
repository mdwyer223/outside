extends Area2D

var rng = RandomNumberGenerator.new()

var focused
var focus_sprite
var interactable

var item

class_name Pine

func _ready():
	item = load("res://scripts/item.gd")
	rng.randomize()
	get_parent().get_node("focusSprite").visible = false
	focused = false
	interactable = true

func _handle_focus_change():
	if focused:
		get_parent().get_node("focusSprite").visible = true
	else:
		get_parent().get_node("focusSprite").visible = false

func set_focus(state):
	focused = state
	_handle_focus_change()
	
func interact(player):
	var new_item = item.new()
	new_item.set_up("pine_wood", rng.randi_range(1, 3))
	player.get_inventory().add_item(new_item)
	set_interactable(false)
	
	return interactable
	
func is_interactable():
	return interactable
	
func set_interactable(state):
	interactable = state
	if not interactable:
		get_node("../Sprite").modulate = Color(.3, .3, .3)
