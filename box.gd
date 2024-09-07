extends TextEdit

var rng = RandomNumberGenerator.new()

var dividertime: float = 0.2

var elapsedtime: float = 0
var playing: bool = false
var letter: int = 0
var play: String = ""

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
	play = morses[letter]
	$"../title".text = morses[letter].replace(".", "·").replace("-", "−") + "\n "

func _ready() -> void:
	chooserand()

func _process(delta: float) -> void:
	elapsedtime += delta
	
	if play.length() > 0:
		if playing:
			if play[0] == ".":
				if elapsedtime > dividertime / 3:
					$"../tone".stop()
					playing = false
					elapsedtime = 0
					play = play.substr(1)
			else:
				if elapsedtime > dividertime:
					$"../tone".stop()
					playing = false
					elapsedtime = 0
					play = play.substr(1)
		else:
			if elapsedtime > dividertime / 3:
				$"../tone".play()
				playing = true
				elapsedtime = 0

func _on_text_changed() -> void:
	if $".".text.to_upper() == char(65 + letter):
		chooserand()
	$".".text = ""
