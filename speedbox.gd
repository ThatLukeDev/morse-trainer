extends TextEdit

func _ready() -> void:
	$".".text = str(int(4 / config.speed))

func _on_text_changed() -> void:
	config.speed = 4.0 / int($".".text)
