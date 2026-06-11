# stage_mic.gd
# The stage mic in the Secret Club. During THE CROWD, this is the
# weapon that actually works. Six-second cooldown between bits -
# you survive the room in between. (These are Da'Herm's regular
# bits. The Perfect Joke is never written. Rule 12 holds.)

class_name StageMic
extends Interactable

signal performed(bit_line: String)

const COOLDOWN := 6.0
const BITS := [
	"—so the raccoon's got my sandwich, and he looks DEEPLY unimpressed—",
	"—my landlord says 'good morning' like it's an invoice—",
	"—you ever been so broke the ATM laughed first?—",
	"—I got a participation trophy for RENT—",
	"—my five-year plan is a coupon—",
]

var _cooldown: float = 0.0
var _bit_index: int = 0


func _ready() -> void:
	prompt_text = "DO A BIT"
	super()
	var stand := ColorRect.new()
	stand.size = Vector2(6, 70)
	stand.position = Vector2(-3, -70)
	stand.color = Color(0.7, 0.7, 0.75)
	add_child(stand)
	var mic := ColorRect.new()
	mic.size = Vector2(16, 18)
	mic.position = Vector2(-8, -86)
	mic.color = Color(0.2, 0.2, 0.24)
	add_child(mic)
	_bit_index = randi() % BITS.size()


func _process(delta: float) -> void:
	super(delta)
	_cooldown = maxf(0.0, _cooldown - delta)


func interact() -> void:
	if _cooldown > 0.0:
		Juice.float_text(global_position + Vector2(0, -110),
				"(read the room... %0.1fs)" % _cooldown, Color(0.7, 0.7, 0.75))
		return
	_cooldown = COOLDOWN
	var bit: String = BITS[_bit_index]
	_bit_index = (_bit_index + 1) % BITS.size()
	performed.emit(bit)
