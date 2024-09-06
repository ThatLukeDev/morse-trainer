extends Button

func pressed():
	get_tree().change_scene_to_file("res://encode.tscn")

func _ready():
	get_node(".").connect("pressed", self.pressed)
