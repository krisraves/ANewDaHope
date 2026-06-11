# save_point.gd
# Comedy club save point. Per the Design Bible: players save by
# performing a set. Functions in M4: heal + set respawn checkpoint.
# Disk persistence (JSON, slots) is M5; this is its world-facing half.

class_name SavePoint
extends Interactable

@export var club_name: String = "THE CHUCKLE HUT"
@export var spawn_id: StringName = &"save"


func _ready() -> void:
	GameState.register_circuit_node(club_name, GameState.current_room, spawn_id)
	prompt_text = "[E] PERFORM A SET"
	detect_size = Vector2(120, 130)
	super()
	_build_visual()


func _build_visual() -> void:
	var marquee := ColorRect.new()
	marquee.size = Vector2(150, 44)
	marquee.position = Vector2(-75, -110)
	marquee.color = Color(0.9, 0.2, 0.45)
	add_child(marquee)

	var name_tag := Label.new()
	name_tag.text = club_name
	name_tag.position = Vector2(-68, -100)
	name_tag.add_theme_font_size_override("font_size", 14)
	name_tag.add_theme_color_override("font_color", Color(1, 1, 0.85))
	add_child(name_tag)

	var stage := ColorRect.new()
	stage.size = Vector2(120, 66)
	stage.position = Vector2(-60, -66)
	stage.color = Color(0.2, 0.1, 0.16)
	add_child(stage)

	var mic := ColorRect.new()
	mic.size = Vector2(8, 40)
	mic.position = Vector2(-4, -44)
	mic.color = Color(0.7, 0.7, 0.75)
	add_child(mic)


func interact() -> void:
	var players := get_tree().get_nodes_in_group("player")
	if players.is_empty():
		return
	var player: Player = players[0]
	player.health.heal_full()
	player.health_changed.emit(player.health.current, player.health.max_health)
	GameState.health = player.health.current
	GameState.set_respawn(GameState.current_room, spawn_id)
	SaveSystem.save_active()  # performing a set writes the save file

	DialogueSystem.start([
		{"speaker": "MC", "text": "Give it up one more time for... Da'Herm, everybody."},
		{"speaker": "", "text": "(You perform a set. Two people clap. One of them means it.)"},
	])
	DialogueSystem.finished.connect(_show_saved_banner, CONNECT_ONE_SHOT)


func _show_saved_banner() -> void:
	for hud in get_tree().get_nodes_in_group("hud"):
		hud.show_banner("SET SAVED — %s\nHealed. Game written to disk." % GameState.active_slot.to_upper())
