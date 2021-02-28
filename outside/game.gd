extends Node

enum game_states {NONE, MAIN_MENU, MAIN_GAME, CUTSCENE, PAUSE_GAME}

var player = load("res://adventurers/blocky/blocky.tscn")
var main_menu = load("res://menus/main/menu.tscn")

var pine = preload("res://objects/trees/pine/pine.tscn")

var packed_campfire = preload("res://objects/fires/campfire/campfire.tscn")

var game_objects

var main_menu_node_name
var main_camera

var game_paused
var current_game_state
var previous_game_state

var game_node
var menus_node

func _ready():
	add_to_group("main")
	game_node = get_node("game")
	menus_node = get_node("menus")
	
	game_node.add_to_group("game")
	menus_node.add_to_group("menus")
	
	menus_node.add_child(set_up_main_menu())
	
	main_camera = Camera2D.new()
	main_camera.add_to_group("main_camera")
	
	game_objects = YSort.new()
	game_node.add_child(game_objects)
	
	game_paused = false
	change_game_state(game_states.MAIN_MENU)
	
func _process(delta):
	check_input()

func _on_start_game():
	# clear menu screens
	menus_node.remove_child(menus_node.get_node(main_menu_node_name))
	
	# load assets
	set_up_main_camera()
	var trees = load_trees()
	var main_player = player.instance()
	
	load_fires()
	
	# connect nodes
	main_player.add_child(main_camera)
	for tree in trees:
		game_objects.add_child(tree)
	game_objects.add_child(main_player)
	
	# set game state
	change_game_state(game_states.MAIN_GAME)

func change_game_state(new_game_state):
	if current_game_state != previous_game_state:
		previous_game_state = current_game_state
	current_game_state = new_game_state
	
func check_input():
	if Input.is_action_just_pressed("main_menu"):
		pause_game()
	
func load_trees():
	var game_objects = []
	var pine_tree_instance = pine.instance()
	pine_tree_instance.set_position(Vector2(200,100))
	game_objects.append(pine_tree_instance)
	
	pine_tree_instance = pine.instance()
	pine_tree_instance.set_position(Vector2(300, 100))
	game_objects.append(pine_tree_instance)
	
	pine_tree_instance = pine.instance()
	pine_tree_instance.set_position(Vector2(400, 100))
	game_objects.append(pine_tree_instance)
	
	return game_objects
	
func load_fires():
	var campfire1 = packed_campfire.instance()
	campfire1.play_animation("campfire_cycle")
	
	campfire1.position.x -= 100
	
	var campfire2 = packed_campfire.instance()
	campfire2.play_animation("campfire_pulse")
	
	campfire2.position.x += 100
	
	game_objects.add_child(campfire1)
	game_objects.add_child(campfire2)
	
func set_up_main_menu():
	var main_menu_instance = main_menu.instance()
	main_menu_instance.connect("start_game_pressed", self, "_on_start_game")
	main_menu_node_name = main_menu_instance.get_name()
	
	return main_menu_instance
	
func set_up_main_camera():
	main_camera.make_current()
	
func pause_game():
	if current_game_state == game_states.MAIN_MENU:
		return
		
	if not game_paused:
		change_game_state(game_states.PAUSE_GAME)
	else:
		change_game_state(previous_game_state)
		
	game_paused = not game_paused
	pause_scene(game_node, game_paused)
	pause_scene(menus_node, game_paused)
		
func pause_node(node, pause_state):
	pause_state = not pause_state
	node.set_process(pause_state)
	node.set_physics_process(pause_state)
	node.set_process_input(pause_state)
	node.set_process_internal(pause_state)
	node.set_process_unhandled_input(pause_state)
	node.set_process_unhandled_key_input(pause_state)

func pause_scene(node, pause_state):
	pause_node(node, pause_state)
	for c in node.get_children():
		pause_scene(c, pause_state)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
