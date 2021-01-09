extends KinematicBody2D

export (float) var speed = 200.0

signal interacted(player)

var interactions
var inventory

func _ready():
	add_to_group("player")
	
	inventory = load("res://scripts/inventory.gd").new()
	inventory.set_up()
	
	interactions = get_node("InteractionDetection")
	
func _process(delta):
	get_input()

func _physics_process(delta):
	move_and_slide(get_movement_velocity())
	
func get_movement_velocity():
	var velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
	return velocity
	
func get_input():
	if Input.is_action_just_pressed("interact"):
		if interactions.valid_interaction():
			interactions.interact_with_object(self)

func get_inventory():
	return inventory
