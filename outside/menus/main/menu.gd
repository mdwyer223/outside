extends Panel

signal start_game_pressed

func _ready():
	get_node("StartGameButton").connect("pressed", self, "_on_StartGameButton_pressed")

func _on_StartGameButton_pressed():
	emit_signal("start_game_pressed")
