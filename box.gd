extends TextEdit

var rng = RandomNumberGenerator.new()

var dividertime: float = config.speed

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
	var chosen: int
	while true:
		chosen = rng.randi_range(0, 25)
		if letter != chosen:
			letter = chosen
			break
	play = morses[letter]
	$"../title".text = morses[letter].replace(".", "·").replace("-", "−") + "\n "

func _ready() -> void:
	grab_focus()
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
