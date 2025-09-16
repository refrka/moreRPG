class_name Item extends GameObject

var item_type: Enums.ITEM_TYPE
var item_data: Dictionary
var modifiers: Array[Modifier]

func _init(_type: Enums.ITEM_TYPE) -> void:
	object_type = Enums.GAME_OBJECT.ITEM
	object_key = _type
	item_type = _type

func get_data() -> void:
	item_data = Data.get_item_data(object_key, item_type)
	create_modifiers()



func create_modifiers() -> void:
	if !item_data.has("modifiers"):
		return
	for modifier in item_data["modifiers"]:
		var type = modifier["type"]
		var property = modifier["property"]
		var value = modifier["value"]
		var new_modifier = Modifier.new(self, property, value, type)
		modifiers.append(new_modifier)


