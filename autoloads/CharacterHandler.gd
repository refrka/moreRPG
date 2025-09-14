extends Node


var character: Character


func new_character(_name: String) -> Character:
	character = Character.new(_name)
	return character