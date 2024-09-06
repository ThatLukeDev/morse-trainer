extends Button

var rng = RandomNumberGenerator.new()

var dividertime: float = 0.2
var cleartime: float = 0.5

var sincelastTime: float = 0
var msg: String = ""
var letter: int = 0

var morses = [
	".-",
	"-...",
	"-.-.",
	"-..",
	".",
	"..-.",
	"--.",
	"....",
	"..",
	".---",
	"-.-",
	".-..",
	"--",
	"-.",
	"---",
	".--.",
	"--.-",
	".-.",
	"...",
	"-",
	"..-",
	"...-",
	".--",
	"-..-",
	"-.--",
	"--..",
]

func chooserand() -> void:
	letter = rng.randi_range(0, 25)
	$"../title".text = char(65 + letter) + "\n "
	pass

func _ready() -> void:
	chooserand()

func _process(delta: float) -> void:
	sincelastTime += delta
	
	if sincelastTime > cleartime:
		if msg == " " + morses[letter]:
			chooserand()
		msg = ""
	
	if msg:
		$".".text = "\n" + msg.replace(".", "·").replace("-", "−") + "\n "
	else:
		$".".text = "\n\n\n "

func _on_button_down() -> void:
	if sincelastTime > dividertime:
		msg += " "
	sincelastTime = 0

func _on_button_up() -> void:
	if sincelastTime > dividertime:
		msg += "-"
	else:
		msg += "."
	sincelastTime = 0
