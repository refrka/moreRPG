extends Resource

var data = {


	Enums.EQUIPMENT.NULL: {
		"name": "Null equipment",
		"desc": "This equipment is nothing",
		"type": Enums.ITEM_TYPE.EQUIPMENT,
		"weight": 0.0,
		"slots": [Enums.EQUIP_SLOT.NULL],
		"modifiers": [ ]
	},



	Enums.EQUIPMENT.ANCIENT_AMULET: {
		"name": "Ancient amulet",
		"desc": "A scuffed gem encased in tarnished metal. A diffuse magical aura accompanies it.",
		"type": Enums.ITEM_TYPE.EQUIPMENT,
		"weight": 0.1,
		"slots": [Enums.EQUIP_SLOT.NECK],
		"modifiers": [
			{
				"type": Enums.MODIFIER.PERMANENT,
				"property": Enums.CHARACTER_PROPERTY.WITS,
				"value": -0.5
			},
			{
				"type": Enums.MODIFIER.PERMANENT,
				"property": Enums.CHARACTER_PROPERTY.MAX_MAGIC,
				"value": 0.5
			},
		]
	},



	Enums.EQUIPMENT.ARMOR_LEATHER: {
		"name": "Leather armor",
		"desc": "Simple leather armor. Provides mediocre defense with minimal penalties to movement.",
		"type": Enums.ITEM_TYPE.EQUIPMENT,
		"weight": 4.0,
		"slots": [Enums.EQUIP_SLOT.TORSO],
		
		"modifiers": [
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.DEFENSE,
				"value": 0.2
			},
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.AGILITY,
				"value": -0.05
			},
		]
	},


	Enums.EQUIPMENT.BOOTS_LEATHER: {
		"name": "Leather boots",
		"desc": "Worn boots of decent leather. Keeps your feet less cold and safe from the earth.",
		"type": Enums.ITEM_TYPE.EQUIPMENT,
		"weight": 2.0,
		"slots": [Enums.EQUIP_SLOT.FEET],
		"modifiers": [
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.DEFENSE,
				"value": 0.1
			},
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.AGILITY,
				"value": 0.2
			},
		]
	},



	Enums.EQUIPMENT.BRACERS_BONE: {
		"name": "Bone bracers",
		"desc": "A pair of bracers carved from bone, lightweight and durable.",
		"type": Enums.ITEM_TYPE.EQUIPMENT,
		"weight": 0.5,
		"slots": [Enums.EQUIP_SLOT.ARMS],
		"modifiers": [
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.MIGHT,
				"value": 0.1
			},
		]
	},



	Enums.EQUIPMENT.CLOAK_PATCHED: {
		"name": "Patched cloak",
		"desc": "A well-used cloak, patched and repaired numerous times over the years.",
		"type": Enums.ITEM_TYPE.EQUIPMENT,
		"weight": 2.0,
		"slots": [Enums.EQUIP_SLOT.BACK],
		"modifiers": [
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.WITS,
				"value": 0.1
			},
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.AGILITY,
				"value": -0.05
			},
		]
	},


	Enums.EQUIPMENT.GREAVES_LEATHER: {
		"name": "Leather greaves",
		"desc": "A pair of decent leather greaves. Not much else to say.",
		"type": Enums.ITEM_TYPE.EQUIPMENT,
		"weight": 3.0,
		"slots": [Enums.EQUIP_SLOT.LEGS],
		"modifiers": [
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.DEFENSE,
				"value": 0.2
			},
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.AGILITY,
				"value": -0.05
			},
		]
	},


	Enums.EQUIPMENT.HELMET_LEATHER: {
		"name": "Leather helmet",
		"desc": "A well-used leather helmet. Judging by the marks, this helmet has served its purpose many times over.",
		"type": Enums.ITEM_TYPE.EQUIPMENT,
		"weight": 2.5,
		"slots": [Enums.EQUIP_SLOT.HEAD],
		"modifiers": [
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.DEFENSE,
				"value": 0.3
			},
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.AGILITY,
				"value": -0.05
			},
		]
	},


	Enums.EQUIPMENT.VEST_CLOTH: {
		"name": "Cloth vest",
		"desc": "A simple cloth vest. Covers the chest but doesn't provide much in the way of protection.",
		"type": Enums.ITEM_TYPE.EQUIPMENT,
		"weight": 1.0,
		"slots": [Enums.EQUIP_SLOT.TORSO],
		"modifiers": [
			{
				"type": Enums.MODIFIER.EQUIP,
				"property": Enums.CHARACTER_PROPERTY.DEFENSE,
				"value": 0.01
			},
		]
	},


}