class_name GameButton extends PanelContainer

@export var button_text: String
@export var hoverable:= true:
	set(value):
		if value == true:
			_connect_hover_signals()
		else:
			_disconnect_hover_signals()
@export var clickable:= true:
	set(value):
		if value == true:
			_connect_click_signal()
		else:
			_disconnect_click_signal()
@export var selectable:= true

@export var button_group: String
@export var multiselect:= false


var selected:= false

var callbacks: Array


var shadow_size: int:
	set(value):
		var stylebox = get_theme_stylebox("panel").duplicate()
		stylebox.shadow_size = value
		add_theme_stylebox_override("panel", stylebox)
		shadow_size = value
var shadow_color: Color:
	set(value):
		var stylebox = get_theme_stylebox("panel").duplicate()
		stylebox.shadow_color = value
		add_theme_stylebox_override("panel", stylebox)
		shadow_color = value
var border_color: Color:
	set(value):
		var stylebox = get_theme_stylebox("panel").duplicate()
		stylebox.border_color = value
		add_theme_stylebox_override("panel", stylebox)
		border_color = value
var bg_color: Color:
	set(value):
		var stylebox = get_theme_stylebox("panel").duplicate()
		stylebox.bg_color = value
		add_theme_stylebox_override("panel", stylebox)
		bg_color = value
var font_color: Color:
	set(value):
		if is_instance_valid(%GameButtonLabel):
			%GameButtonLabel.add_theme_color_override("font_color", value)
		font_color = value







func _ready() -> void:
	Signals.GLOBAL_deselect.connect(deselect)
	_hover(false)
	%GameButtonLabel.text = button_text
	if hoverable:
		_connect_hover_signals()
	if clickable:
		_connect_click_signal()







func _connect_hover_signals() -> void:
	if !mouse_entered.has_connections():
		mouse_entered.connect(_hover.bind(true))
	if !mouse_exited.has_connections():
		mouse_exited.connect(_hover.bind(false))

func _disconnect_hover_signals() -> void:
	if mouse_entered.has_connections():
		mouse_entered.disconnect(_hover)
	if mouse_exited.has_connections():
		mouse_exited.disconnect(_hover)


func _connect_click_signal() -> void:
	if !gui_input.has_connections():
		gui_input.connect(_click)

func _disconnect_click_signal() -> void:
	if gui_input.has_connections():
		gui_input.disconnect(_click)


func _hover(state: bool) -> void:
	if selected:
		return
	if state == true:
		shadow_size = 5
		shadow_color = Color.html("#9c9c9c99")
		border_color = Color.html("#bebebe")
		bg_color = Color.html("#434343")
		font_color = Color.WHITE
	else:
		shadow_size = 0
		shadow_color = Color(0.0,0.0,0.0,0.0)
		border_color = Color.html("#626262")
		bg_color = Color.html("#2d2d2d")
		font_color = Color.html("#bebebe")



func _click(input: InputEvent) -> void:
	if input.is_action_pressed("select"):
		for callback in callbacks:
			callback.call()
		if selectable and !selected:
			select()



func select() -> void:
	var game_buttons = get_tree().get_nodes_in_group("game_button")
	for button in game_buttons:
		if button.button_group == button_group:
			if !multiselect:
				button.deselect()
	selected = true
	shadow_size = 5
	shadow_color = Color.html("#9cfffe8b")
	border_color = Color.html("#affafa")
	font_color = Color.WHITE



func deselect() -> void:
	selected = false
	shadow_size = 0
	border_color = Color.html("#626262")
	font_color = Color.html("#bebebe")
	bg_color = Color.html("#2d2d2d")


func get_group_buttons() -> Array:
	var group_buttons = []
	var game_buttons = get_tree().get_nodes_in_group("game_button")
	for button in game_buttons:
		if button.button_group == button_group:
			group_buttons.append(button)
	return group_buttons


func add_callback(callback: Callable) -> void:
	callbacks.append(callback)



func _notification(what: int) -> void:
	if what == NOTIFICATION_VISIBILITY_CHANGED:
		if visible == false:
			deselect()