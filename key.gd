extends Button

var dividertime: float = 0.2
var cleartime: float = 0.5

var sincelastTime: float = 0
var msg: String = ""

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	sincelastTime += delta
	
	if sincelastTime > cleartime:
		msg = ""
	
	if msg:
		$".".text = "\n" + msg + "\n "
	else:
		$".".text = "\n\n\n "

func _on_button_down() -> void:
	if sincelastTime > dividertime:
		msg += " "
	sincelastTime = 0

func _on_button_up() -> void:
	if sincelastTime > dividertime:
		msg += "−"
	else:
		msg += "·"
	sincelastTime = 0
