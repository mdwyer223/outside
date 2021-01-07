extends Node

var player = load("res://adventurers/blocky/blocky.tscn")
var main_menu = load("res://menus/main/menu.tscn")

var pine = load("res://objects/trees/pine/pine.tscn")

var main_menu_node_name

func _ready():
	var main_menu_instance = main_menu.instance()
	main_menu_node_name = main_menu_instance.get_name()
	self.add_child(main_menu_instance)
	get_node(main_menu_node_name).connect("start_game_pressed", self, "_on_start_game")

func _on_start_game():
	self.remove_child(get_node(main_menu_node_name))
	var pine_tree_instance = pine.instance()
	pine_tree_instance.position.x = 200
	pine_tree_instance.position.y = 100
	self.add_child(pine_tree_instance)
	self.add_child(player.instance())
