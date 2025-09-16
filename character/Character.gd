class_name Character extends Node



var max_health		:= 25.0
var current_health	:= 25.0:
	set(value):
		current_health = clamp(value, 0, max_health)
var max_energy		:= 10.0
var current_energy	:= 10.0:
	set(value):
		current_energy = clamp(value, 0, max_energy)
var max_magic		:= 0.0
var current_magic	:= 0.0:
	set(value):
		current_magic = clamp(value, 0, max_magic)
var base_might		:= 1.0
var base_agility	:= 1.0
var base_wits		:= 1.0
var base_attack		:= 1.0
var base_defense	:= 1.0


var current_carry_weight:= 0.0:
	set(value):

		if value >= (max_carry_capacity * 0.8) and value < max_carry_capacity:
			burdened = true
		elif value >= max_carry_capacity:
			burdened = true
			overburdened = true
		current_carry_weight = value

var max_carry_capacity:= 100.0
var burdened:= false:
	set(value):
		if value == true:
			var warning = true
			Signals.CHARACTER_overburdened.emit(warning)
		burdened = value
var overburdened:= false:
	set(value):
		if value == true:
			Signals.CHARACTER_overburdened.emit()
		overburdened = value


var modifiers: Array[Modifier]


var inventory: Inventory


func _init(_name: String) -> void:
	name = _name
	Signals.CHARACTER_item_added_to_inventory.connect(_add_carry_weight)
	Signals.CHARACTER_item_removed_from_inventory.connect(_remove_carry_weight)
	Signals.CHARACTER_overburdened.connect(_overburdened_alert)


func create_inventory() -> void:
	inventory = Inventory.new()



func _overburdened_alert(warning:= false) -> void:
	if warning == true:
		Alert.new_alert("You are approaching your maximum carry weight capacity.")
	else:
		Alert.new_alert("You have exceeded your maxmimum carry weight capacity")


func _add_carry_weight(item: Item) -> void:
	var item_weight = item.item_data["weight"]
	current_carry_weight += item_weight
	Signals.CHARACTER_property_updated.emit(Enums.CHARACTER_PROPERTY.CARRY_WEIGHT)


func _remove_carry_weight(item: Item) -> void:
	var item_weight = item.item_data["weight"]
	current_carry_weight -= item_weight
	Signals.CHARACTER_property_updated.emit(Enums.CHARACTER_PROPERTY.CARRY_WEIGHT)


