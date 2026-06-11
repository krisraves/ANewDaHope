# interactable.gd
# Base for everything the player can press E on: NPCs, doors,
# save points, busk spots. Builds its own collision + prompt so
# rooms can spawn interactables from code with two lines.

class_name Interactable
extends Area2D

@export var prompt_text: String = "[E]"
@export var detect_size: Vector2 = Vector2(90, 110)

var _player_in_range: bool = false
var _prompt: Label


func _ready() -> void:
	collision_layer = 0
	collision_mask = 2  # player body
	monitorable = false

	var shape := CollisionShape2D.new()
	var rect := RectangleShape2D.new()
	rect.size = detect_size
	shape.shape = rect
	add_child(shape)

	_prompt = Label.new()
	_prompt.text = prompt_text
	_prompt.position = Vector2(-14, -detect_size.y * 0.5 - 34.0)
	_prompt.visible = false
	_prompt.add_theme_color_override("font_color", Color(1, 0.85, 0.4))
	_prompt.add_theme_color_override("font_outline_color", Color.BLACK)
	_prompt.add_theme_constant_override("outline_size", 4)
	add_child(_prompt)

	body_entered.connect(_on_body_in)
	body_exited.connect(_on_body_out)


func _on_body_in(body: Node2D) -> void:
	if body is Player:
		_player_in_range = true


func _on_body_out(body: Node2D) -> void:
	if body is Player:
		_player_in_range = false


func _process(_delta: float) -> void:
	_prompt.visible = _player_in_range and not DialogueSystem.active and _prompt_enabled()


func _unhandled_input(event: InputEvent) -> void:
	if not _player_in_range or DialogueSystem.active:
		return
	if event.is_action_pressed("interact"):
		get_viewport().set_input_as_handled()
		interact()


# ------------------------------------------------------------ overridables

func interact() -> void:
	pass


func _prompt_enabled() -> bool:
	return true
