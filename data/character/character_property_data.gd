extends Resource


var data = {


	Enums.CHARACTER_PROPERTY.NULL: {
		"name": "Null character property",
		"desc": "This property is nothing and affects nothing",
	},


	Enums.CHARACTER_PROPERTY.MODIFIER: {
		"name": "Modifier",
		"desc": "Modifiers are applied to the relevant property when calculating the final value for relevant situations.",
	},


	Enums.CHARACTER_PROPERTY.LEVEL: {
		"name": "Level",
		"desc": "This is your character's level. Level is a measure of your overall progress and development across all areas of expertise.",
	},


	Enums.CHARACTER_PROPERTY.HEALTH: {
		"name": "Health",
		"desc": "Your character's health represents the overall state of your physical and mental wellbeing. If this number reaches 0.0, you are dead.",
	},


	Enums.CHARACTER_PROPERTY.MAX_HEALTH: {
		"name": "Maximum health",
		"desc": "This is your character's maximum health, the highest value current health can reach when increased.",
	},


	Enums.CHARACTER_PROPERTY.CURRENT_HEALTH: {
		"name": "Current health",
		"desc": "Your character's current health is the active health value at that moment.",
	},


	Enums.CHARACTER_PROPERTY.ENERGY: {
		"name": "Energy",
		"desc": "Energy is used when performing various actions like travel or combat. It is replenished by resting/sleeping or by magical means. If this reaches 0.0, you will fall unconscious from exhaustion and/or malnutrition.",
	},


	Enums.CHARACTER_PROPERTY.MAX_ENERGY: {
		"name": "Max energy",
		"desc": "This is your character's maximum energy, the highest value current energy can reach when increased.",
	},


	Enums.CHARACTER_PROPERTY.CURRENT_ENERGY: {
		"name": "Current energy",
		"desc": "This is your character's available energy. When this is used, you must replenish it through rest or magic in order to continue on your journey.",
	},


	Enums.CHARACTER_PROPERTY.MAGIC: {
		"name": "Magic",
		"desc": "Magic is the resource required to channel the forces of the other realms. This value degrades over time unless maintained and grows when the connection is nourished. If this reaches 0.0, you will be unable to use magic or magical items.",
	},


	Enums.CHARACTER_PROPERTY.MAX_MAGIC: {
		"name": "Max magic",
		"desc": "This is your character's maximum magic, the highest value current magic can reach when increased.",
	},


	Enums.CHARACTER_PROPERTY.CURRENT_MAGIC: {
		"name": "Current magic",
		"desc": "This is your character's current, available magic. Some actions deplete this value, others may only require a minimum value.",
	},


	Enums.CHARACTER_PROPERTY.MIGHT: {
		"name": "Might",
		"desc": "Might is the measure of your strength, endurance, and overall physical fitness. If this value reaches 0.0, your character will be unable to move or breathe and will die.",
	},


	Enums.CHARACTER_PROPERTY.AGILITY: {
		"name": "Agilty",
		"desc": "Agility is the measure of your reaction timing, balance, and overall dexterity. If this value reaches 0.0, your character will be unable to move or breathe and will die.",
	},


	Enums.CHARACTER_PROPERTY.WITS: {
		"name": "Wits",
		"desc": "Wits is the measure of your overall mental capacity. This stat is critical for use of Magic. If this value reaches 0.0, your character will be unable to move or breathe and will die.",
	},


	Enums.CHARACTER_PROPERTY.ATTACK: {
		"name": "Attack",
		"desc": "Attack is the measure of your ability to overcome defenses.",
	},


	Enums.CHARACTER_PROPERTY.DEFENSE: {
		"name": "Defense",
		"desc": "Defense is the measure of your ability to withstand attacks.",
	},


	Enums.CHARACTER_PROPERTY.BASE_ATTACK: {
		"name": "Base attack",
		"desc": "Your character's base attack, before any modifiers are applied.",
	},


	Enums.CHARACTER_PROPERTY.BASE_DEFENSE: {
		"name": "Base defense",
		"desc": "Your character's base defense, before any modifiers are applied.",
	},


	Enums.CHARACTER_PROPERTY.CARRY_WEIGHT: {
		"name": "Carry weight",
		"desc": "The weight of your posessions - all the items in your inventory. If you exceed your maxmium carry capacity you will spend energy quicker and achieve less when performing some actions.",
	},


}