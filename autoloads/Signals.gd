extends Node
@warning_ignore_start("unused_signal")


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


signal CHARACTER_created
signal CHARACTER_equipment_updated(slots: Array)
signal CHARACTER_item_added_to_inventory(item: Item)
signal CHARACTER_item_removed_from_inventory(item: Item)
signal CHARACTER_modifiers_updated(new_modifier: Modifier)
signal CHARACTER_overburdened
signal CHARACTER_property_updated(property: Enums.CHARACTER_PROPERTY)


signal DYNAMIC_VALUE_changed(dynamic_value: DynamicValue, old_value: Variant)


signal ERROR_fatal


signal GAME_state_changed(new_state: Enums.GAME_STATE)
signal GAME_state_requested(requested_state: Enums.GAME_STATE)


signal GLOBAL_deselect



signal OBJECT_card_selected(object: GameObject)