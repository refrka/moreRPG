extends Resource

var data = {


	Enums.WEAPON.NULL: {
		"name": "Null weapon",
		"desc": "This weapon does nothing.",
		"type": Enums.ITEM_TYPE.WEAPON,
		"weight": 0.0,
		"slots": [ ],
		"modifiers": [ ]
	},

	Enums.WEAPON.DAGGER_IRON: {
		"name": "Iron dagger",
		"desc": "A simple iron dagger of decent quality. Good for suprise attacks.",
		"type": Enums.ITEM_TYPE.WEAPON,
		"weight": 2.0,
		"slots": [Enums.EQUIP_SLOT.WEAPON_PRIMARY, Enums.EQUIP_SLOT.WEAPON_SECONDARY],
		"modifiers": [ ]
	},


}