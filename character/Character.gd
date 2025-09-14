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

var modifiers = {
	Enums.CHARACTER_PROPERTY.NULL: null,
}





func _init(_name: String) -> void:
	name = _name