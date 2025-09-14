extends MarginContainer


var message: String = "Alert message"
var duration: float = 3.0


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	%AlertMessage.text = message
	modulate = Color(0.0,0.0,0.0,0.0)

	%AnimationPlayer.play("fade_in")
	if duration > 0.0:
		await get_tree().create_timer(duration).timeout
		%AnimationPlayer.play("fade_out")
	
	

func kill() -> void:
	queue_free.call_deferred()