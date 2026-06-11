# door.gd
# Room transition. Optionally gated by Followers - the game's first
# Follower gate, per the Design Bible's access-threshold model.
# Followers are checked, never spent.

class_name Door
extends Interactable

@export var door_label: String = "DOOR"
@export var target_scene: String = ""
@export var target_spawn: StringName = &"default"
@export var min_followers: int = 0
@export var gate_speaker: String = "DOOR GUY"
@export var gate_line: String = "Numbers ain't numbering. Come back with %d followers."
@export var required_ability: StringName = &""  # e.g. &"double_jump"
@export var ability_gate_line: String = "(You can't reach the handle from here. Yet.)"
@export var required_flag: StringName = &""
@export var flag_gate_line: String = "(Not yet. Something has to happen first.)"


func _ready() -> void:
	prompt_text = "[E] ENTER"
	detect_size = Vector2(100, 130)
	super()
	_build_visual()


func _build_visual() -> void:
	var frame := ColorRect.new()
	frame.size = Vector2(70, 110)
	frame.position = Vector2(-35, -55)
	frame.color = Color(0.15, 0.13, 0.18)
	add_child(frame)

	var slab := ColorRect.new()
	slab.size = Vector2(56, 98)
	slab.position = Vector2(-28, -47)
	slab.color = Color(0.45, 0.3, 0.18)
	add_child(slab)

	var tag := Label.new()
	tag.text = door_label
	tag.position = Vector2(-60, -92)
	tag.add_theme_color_override("font_color", Color(0.95, 0.8, 0.5))
	tag.add_theme_color_override("font_outline_color", Color.BLACK)
	tag.add_theme_constant_override("outline_size", 4)
	add_child(tag)


func interact() -> void:
	if required_ability == &"double_jump" and not GameState.has_double_jump:
		DialogueSystem.start_simple("", [ability_gate_line])
		return
	if required_ability == &"flame_dash" and not GameState.has_flame_dash:
		DialogueSystem.start_simple("", [ability_gate_line])
		return
	if required_flag != &"" and not GameState.has_flag(required_flag):
		DialogueSystem.start_simple(gate_speaker, [flag_gate_line])
		return
	# VERIFIED costume (08_COSTUMES): artificial status. Follower
	# thresholds take you 25% more seriously for no reason.
	var threshold := min_followers
	if GameState.costume == &"verified":
		threshold = int(ceil(min_followers * 0.75))
	if GameState.followers < threshold:
		DialogueSystem.start_simple(gate_speaker, [gate_line % threshold])
		return
	GameState.change_room(target_scene, target_spawn)
