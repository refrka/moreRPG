extends Node

var alert_scene = load("res://Alert.tscn")
var game_control: Control


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	game_control = get_tree().get_first_node_in_group("game_control")


func new_alert(message: String) -> void:
	var alert = alert_scene.instantiate()
	alert.message = message
	game_control.add_child(alert)


func new_fatal_alert(message: String) -> void:
	var alert = alert_scene.instantiate()
	alert.duration = 0.0
	alert.message = message
	Signals.ERROR_fatal.emit()