extends RigidBody2D

var animator:AnimatedSprite
var current_animation:String

func _ready():
	animator = get_node("AnimatedSprite")
	
	animator.play(current_animation)

func play_animation(animation:String):
	current_animation = animation
