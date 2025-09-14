extends Node

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


const GAME_STATE = sysEnums.GameState
const GAME_OBJECT = sysEnums.GameObject

const CHARACTER_PROPERTY = charEnums.CharacterProperty

const ITEM_TYPE = itemEnums.ItemType
const NULL_ITEM = itemEnums.NullItem
const CRAFTING = itemEnums.CraftingItem
const EQUIPMENT = itemEnums.EquipmentItem
const POTION = itemEnums.PotionItem
const PROVISION = itemEnums.ProvisionItem
const TOOL = itemEnums.ToolItem
const VALUABLE = itemEnums.ValuableItem
const WEAPON = itemEnums.WeaponItem

const REGION = worldEnums.Region
const LOCATION = worldEnums.Location

const ENTITY_TYPE = entityEnums.EntityType
const CREATURE = entityEnums.Creature
const HUMANOID = entityEnums.Humanoid
const HUMANOID_RACE = entityEnums.HumanoidRace
const SPIRIT = entityEnums.Spirit




var enum_list = {
	"game_state": GAME_STATE,
	"game_object": GAME_OBJECT,

	"character_property": CHARACTER_PROPERTY,

	"item_type": ITEM_TYPE,
	"crafting": CRAFTING,
	"equipment": EQUIPMENT,
	"potion": POTION,
	"provision": PROVISION,
	"tool": TOOL,
	"valuable": VALUABLE,
	"weapon": WEAPON,

	"region": REGION,
	"location": LOCATION,

	"entity_type": ENTITY_TYPE,
	"creature": CREATURE,
	"humanoid": HUMANOID,
	"humanoid_race": HUMANOID_RACE,
	"spirit": SPIRIT,
}



func verify_enums() -> void:
	var list = {}
	for enum_name in enum_list:
		list[enum_name] = []
		for enum_value_name in enum_list[enum_name]:
			list[enum_name].append(enum_value_name)


func get_enum_value(enum_list_name: String, enum_value_name: String) -> int:
	var list = enum_list[enum_list_name]
	return list[enum_value_name]


func get_enum_list(enum_list_name: String) -> Dictionary:
	var list = enum_list[enum_list_name]
	return list