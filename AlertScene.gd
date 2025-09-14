extends MarginContainer


var message: String = "Alert message"


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	%AlertMessage.text = message
	modulate = Color(0.0,0.0,0.0,0.0)

	%AnimationPlayer.play("fade_in")
	await get_tree().create_timer(3.0).timeout
	%AnimationPlayer.play("fade_out")
	
	

func kill() -> void:
	queue_free.call_deferred()