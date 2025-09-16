class_name Modifier extends Object

var source: GameObject
var property: Enums.CHARACTER_PROPERTY
var value: Variant
var type: Enums.MODIFIER


func _init(_source: GameObject, _property: Enums.CHARACTER_PROPERTY, _value: Variant, _type: Enums.MODIFIER) -> void:
	source = _source
	property = _property
	value = _value
	type = _type