extends Node

var error_log: Array
var fatal_error:= false


func log_error(message: String) -> void:
	error_log.append(message)
	print("[ERROR] %s" % message)


func log_fatal(message: String) -> void:
	var alert_message = "[ERROR] %s" % message
	print("[ERROR] %s" % message)
	fatal_error = true