extends Node

var player = load("res://adventurers/blocky/blocky.tscn")
var main_menu = load("res://menus/main/menu.tscn")

var pine = preload("res://objects/trees/pine/pine.tscn")

var main_menu_node_name

func _ready():
	add_to_group("main")
	var main_menu_instance = main_menu.instance()
	main_menu_node_name = main_menu_instance.get_name()
	self.add_child(main_menu_instance)
	get_node(main_menu_node_name).connect("start_game_pressed", self, "_on_start_game")

func _on_start_game():
	self.remove_child(get_node(main_menu_node_name))
	var pine_tree_instance = pine.instance()
	load_trees()
	self.add_child(player.instance())
	
	
func load_trees():
	var pine_tree_instance = pine.instance()
	pine_tree_instance.set_position(Vector2(200,100))
	self.add_child(pine_tree_instance)
	
	pine_tree_instance = pine.instance()
	pine_tree_instance.set_position(Vector2(300, 100))
	self.add_child(pine_tree_instance)
	
	pine_tree_instance = pine.instance()
	pine_tree_instance.set_position(Vector2(400, 100))
	self.add_child(pine_tree_instance)
