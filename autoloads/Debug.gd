extends Node

var error_log: Array


func log_error(message: String) -> void:
	error_log.append(message)
	print("[ERROR] %s" % message)