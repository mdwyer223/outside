extends Area2D

var focused
var focus_img = preload("res://assets/arrow.png")
var focus_sprite

class_name Pine

func _ready():
	get_parent().get_node("focusSprite").visible = false
	focused = false

func _handle_focus_change():
	if focused:
		get_parent().get_node("focusSprite").visible = true
	else:
		get_parent().get_node("focusSprite").visible = false

func set_focus(state):
	focused = state
	_handle_focus_change()
	
func interact(player):
	print("interacted")
	pass
