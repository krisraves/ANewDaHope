# evidence.gd
# Evidence objects (the Dark Chapter). The discovery is told through
# ARTIFACTS, not depictions (RULE 3: consequences, never gratuitous;
# STORY_BIBLE: "the player sees consequences rather than comedy").
# Examining gives nothing - no followers, no items. Knowing is the
# only outcome.

class_name Evidence
extends Interactable

@export var evidence_name: String = "LEDGER"
@export var lines: Array = []  # [{speaker, text}]
@export var object_color: Color = Color(0.45, 0.43, 0.4)
@export var object_size: Vector2 = Vector2(38, 30)

var _examined: bool = false


func _ready() -> void:
	prompt_text = "EXAMINE"
	super()
	var object := ColorRect.new()
	object.size = object_size
	object.position = Vector2(-object_size.x * 0.5, -object_size.y)
	object.color = object_color
	add_child(object)
	var tag := Label.new()
	tag.text = evidence_name
	tag.position = Vector2(-object_size.x * 0.5 - 4.0, -object_size.y - 26.0)
	tag.add_theme_font_size_override("font_size", 11)
	tag.add_theme_color_override("font_color", Color(0.55, 0.53, 0.5))
	tag.add_theme_color_override("font_outline_color", Color.BLACK)
	tag.add_theme_constant_override("outline_size", 3)
	add_child(tag)


func interact() -> void:
	if lines.is_empty():
		return
	DialogueSystem.start(lines)
	if not _examined:
		_examined = true
		GameState.set_flag(StringName("evidence_" + evidence_name.to_lower().replace(" ", "_")))
