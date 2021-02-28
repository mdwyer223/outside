extends AnimatedSprite

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("left"):
		play("walk_left")
	if Input.is_action_just_pressed("right"):
		play("walk_right")
	if Input.is_action_just_pressed("up"):
		play("walk_up")
	if Input.is_action_just_pressed("down"):
		play("walk_down")
