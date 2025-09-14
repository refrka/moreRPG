extends Node

var monitored_values: Array



func _ready() -> void:
    Signals.DYNAMIC_VALUE_changed.connect(_handle_updated_value)


func monitor_value(value: DynamicValue) -> void:
    if !monitored_values.has(value):
        monitored_values.append(value)


func unmonitor_value(value: DynamicValue) -> void:
    if monitored_values.has(value):
        monitored_values.erase(value)




func _handle_updated_value(dynamic_value: DynamicValue, old_value: Variant) -> void:
    var new_value = dynamic_value.get_typed_value()
    if dynamic_value.value_type == dynamic_value.ValueType.INT or dynamic_value.value_type == dynamic_value.ValueType.FLOAT:
        if new_value < old_value:
            dynamic_value.color_negative()
        elif new_value > old_value:
            dynamic_value.color_positive()