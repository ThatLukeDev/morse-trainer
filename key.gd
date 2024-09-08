extends Button

var rng = RandomNumberGenerator.new()

var dividertime: float = config.speed
var cleartime: float = config.speed

var sincelastTime: float = 0
var msg: String = ""
var letter: int = 0
var buttondown: bool = false

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
	var chosen: int
	while true:
		chosen = rng.randi_range(0, 25)
		if letter != chosen:
			letter = chosen
			break
	$"../title".text = char(65 + letter) + "\n "

func _ready() -> void:
	grab_focus()
	chooserand()

func _process(delta: float) -> void:
	sincelastTime += delta
	
	if sincelastTime > cleartime and not buttondown:
		if msg == " " + morses[letter]:
			chooserand()
		msg = ""
	
	if msg:
		$".".text = "\n" + msg.replace(".", "·").replace("-", "−") + "\n "
	else:
		$".".text = "\n\n\n "

func _on_button_down() -> void:
	buttondown = true
	if sincelastTime > dividertime:
		msg += " "
	sincelastTime = 0
	$"../tone".play()

func _on_button_up() -> void:
	buttondown = false
	if sincelastTime > dividertime:
		msg += "-"
	else:
		msg += "."
	sincelastTime = 0
	$"../tone".stop()
