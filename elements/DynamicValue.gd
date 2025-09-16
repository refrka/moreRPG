class_name DynamicValue extends RichTextLabel

enum ValueType {
	NULL,
	INT		= 2,
	FLOAT	= 3,
	STRING	= 4,
}

@export var value_text: String:
	set(value):
		if monitor:
			if value != value_text:
				var old_value = get_typed_value()
				value_text = value
				Signals.DYNAMIC_VALUE_changed.emit(self, old_value)
		else:
			value_text = value
		text = value_text

@export var monitor:= true:
	set(value):
		if value == true:
			DynamicValueHandler.monitor_value(self)
		else:
			DynamicValueHandler.unmonitor_value(self)
var value_type: ValueType
@export var flip_color:= false



func _ready() -> void:
	text = value_text
	set_value_type()
	%Timer.timeout.connect(reset_color)
	%Timer.one_shot = true


func set_value_type() -> void:
	if value_text.is_valid_int():
		value_type = ValueType.INT
	elif value_text.is_valid_float():
		value_type = ValueType.FLOAT
	else:
		value_type = ValueType.STRING


func get_typed_value() -> Variant:
	var value: Variant
	if value_type == ValueType.NULL:
		set_value_type()
	match value_type:
		ValueType.INT:
			value = int(value_text)
		ValueType.FLOAT:
			value = float(value_text)
		ValueType.STRING:
			value = value_text
	return value


func update_value(new_value: Variant) -> void:
	var type = typeof(new_value) as ValueType
	if type != value_type:
		Debug.log_error("Invalid type assignment to Dynamic Value: %s" % self.name)
	else:
		value_text = str(new_value)



func color_negative() -> void:
	add_theme_color_override("default_color", Color.RED)
	%Timer.start(3.0)


func color_positive() -> void:
	add_theme_color_override("default_color", Color.GREEN)
	%Timer.start(3.0)


func reset_color() -> void:
	remove_theme_color_override("default_color")
		