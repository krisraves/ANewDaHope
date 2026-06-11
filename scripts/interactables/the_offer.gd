# the_offer.gd
# THE BAD ENDING (00_PROJECT_OVERVIEW / 03_STORY_BIBLE):
# "Da'Herm joins the system. Receives fame. Loses himself."
#
# A contract on a podium at the Summit, before the fight. Two-step
# interact so nobody signs away their soul by accident: the first
# press hears the pitch, the second press signs. RULE 8 holds even
# here - Tuff makes the offer like it's a bit he's workshopping.

class_name TheOffer
extends Interactable

var _pitched: bool = false


func _init() -> void:
	prompt_text = "[E] THE OFFER"


func _ready() -> void:
	super()
	var podium := ColorRect.new()
	podium.size = Vector2(54, 80)
	podium.position = Vector2(-27, -80)
	podium.color = Color(0.5, 0.42, 0.25)
	add_child(podium)
	var paper := ColorRect.new()
	paper.size = Vector2(40, 26)
	paper.position = Vector2(-20, -94)
	paper.color = Color(0.92, 0.9, 0.85)
	add_child(paper)
	var pen := ColorRect.new()
	pen.size = Vector2(4, 18)
	pen.position = Vector2(14, -100)
	pen.color = Color(0.95, 0.8, 0.25)
	add_child(pen)


func interact() -> void:
	if not _pitched:
		_pitched = true
		prompt_text = "[E] SIGN IT"
		DialogueSystem.start([
			{"speaker": "TUFF TIDDY", "text": "(from the stage, delighted) WAIT! Before the violence - a COUNTER-offer. I've been workshopping it."},
			{"speaker": "TUFF TIDDY", "text": "The special drops at midnight. The followers. The island privileges. The seat at the table. All of it. One signature."},
			{"speaker": "DA'HERM", "text": "And the people under the estates?"},
			{"speaker": "TUFF TIDDY", "text": "...Who? (beat) See, THAT'S the attitude the contract fixes. It's a great clause. Clause 13. You've met."},
			{"speaker": "", "text": "(The pen is already warm. The prompt has changed.)"},
		])
		return
	DialogueSystem.start([
		{"speaker": "", "text": "(You pick up the pen.)"},
		{"speaker": "", "text": "(Somewhere very far down, something exhales.)"},
		{"speaker": "TUFF TIDDY", "text": "KID. Welcome to the industry. You're gonna be HUGE."},
	])
	DialogueSystem.finished.connect(_sign, CONNECT_ONE_SHOT)


func _sign() -> void:
	GameState.set_flag(&"bad_ending_unlocked")
	SaveSystem.autosave()
	get_tree().change_scene_to_file("res://scenes/levels/ending_bad.tscn")
