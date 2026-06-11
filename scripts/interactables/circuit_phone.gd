# circuit_phone.gd
# COMEDY CIRCUIT fast travel (Design Bible: fast travel between
# clubs). A payphone outside each venue. Pick a discovered node,
# go there. The network grows as the game grows - the system is
# the deliverable, the two slice nodes are the proof.

class_name CircuitPhone
extends Interactable

var _menu_layer: CanvasLayer = null


func _ready() -> void:
	prompt_text = "[E] COMEDY CIRCUIT"
	detect_size = Vector2(90, 110)
	super()
	_build_visual()


func _build_visual() -> void:
	var booth := ColorRect.new()
	booth.size = Vector2(44, 90)
	booth.position = Vector2(-22, -90)
	booth.color = Color(0.85, 0.2, 0.25)
	add_child(booth)
	var glass := ColorRect.new()
	glass.size = Vector2(30, 40)
	glass.position = Vector2(-15, -80)
	glass.color = Color(0.6, 0.8, 0.9, 0.7)
	add_child(glass)


func interact() -> void:
	if GameState.circuit_nodes.size() < 2:
		DialogueSystem.start_simple("CIRCUIT PHONE",
			["(A dial tone. The Comedy Circuit knows %d venue. Find more clubs.)" % GameState.circuit_nodes.size()])
		return
	_open_menu()


func _open_menu() -> void:
	get_tree().paused = true
	_menu_layer = CanvasLayer.new()
	_menu_layer.layer = 45
	_menu_layer.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(_menu_layer)

	var panel := ColorRect.new()
	panel.color = Color(0.06, 0.05, 0.09, 0.95)
	panel.set_anchors_preset(Control.PRESET_CENTER)
	panel.offset_left = -260.0
	panel.offset_right = 260.0
	panel.offset_top = -180.0
	panel.offset_bottom = 180.0
	_menu_layer.add_child(panel)

	var rows := VBoxContainer.new()
	rows.position = Vector2(30, 24)
	rows.size = Vector2(460, 320)
	rows.add_theme_constant_override("separation", 12)
	panel.add_child(rows)

	var title := Label.new()
	title.text = "COMEDY CIRCUIT — WHERE TO?"
	title.add_theme_font_size_override("font_size", 22)
	title.add_theme_color_override("font_color", Color(1, 0.7, 0.2))
	rows.add_child(title)

	for node: Dictionary in GameState.circuit_nodes:
		var button := Button.new()
		var here: bool = node["scene"] == GameState.current_room
		button.text = ("▶ %s (you are here)" if here else "  %s") % node["name"]
		button.disabled = here
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.add_theme_font_size_override("font_size", 20)
		button.pressed.connect(_travel.bind(node))
		rows.add_child(button)

	var cancel := Button.new()
	cancel.text = "  HANG UP"
	cancel.alignment = HORIZONTAL_ALIGNMENT_LEFT
	cancel.add_theme_font_size_override("font_size", 20)
	cancel.pressed.connect(_close_menu)
	rows.add_child(cancel)


func _travel(node: Dictionary) -> void:
	_close_menu()
	GameState.change_room(node["scene"], StringName(node["spawn"]))


func _close_menu() -> void:
	get_tree().paused = false
	if _menu_layer != null:
		_menu_layer.queue_free()
		_menu_layer = null
