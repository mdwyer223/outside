extends Area2D

var objects = []
var focus = 0

func _ready():
	add_to_group("player_interaction")
	connect("area_entered", self, "_add_object_to_list")
	connect("area_exited", self, "_remove_object_from_list")
	
func _process(delta):
	check_focus()
	
func _add_object_to_list(body):
	objects.append(body)
	adjust_focus()

func _remove_object_from_list(body):
	reset_focus()
	for i in range(len(objects)):
		if objects[i] == body:
			objects.remove(i)
	adjust_focus()
		
func check_focus():
	var focus_change = false
	if Input.is_action_just_pressed("arrow_up"):
		focus += 1
		focus_change = true
	if Input.is_action_just_pressed("arrow_down"):
		focus -= 1
		focus_change = true
		
	if focus_change:
		adjust_focus()

func adjust_focus():
	if focus >= len(objects):
		focus = 0
	elif focus < 0:
		focus = len(objects) - 1
	
	for i in range(len(objects)):
		objects[i].set_focus(false)
		if i == focus:
			objects[i].set_focus(true)

func reset_focus():
	for i in range(len(objects)):
		objects[i].set_focus(false)

func interact_with_object(player):
	var object = objects[focus]
	var response = object.interact(player)

func get_objects():
	return objects
	
func valid_interaction():
	if len(objects) > 0:
		return true
	return false
