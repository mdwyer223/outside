extends Area2D

var focused

func _ready():
	focused = false
	
func set_focus(state):
	print(state)
	focused = state
	
func interact(player):
	print("interacted")
	pass
