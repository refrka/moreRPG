extends Node

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


const GAME_STATE = sysEnums.GameState
const GAME_OBJECT = sysEnums.GameObject

const CHARACTER_PROPERTY = charEnums.CharacterProperty
const ACTION = charEnums.Action
const MODIFIER = charEnums.Modifier
const EQUIP_SLOT = charEnums.EquipSlot

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
	"action_data": ACTION,
	"equip_slot": EQUIP_SLOT,

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


func verify_crafting_enums() -> void:
	var list = get_enum_list("crafting")
	for enum_value in list:
		if !Data.item_has_data(enum_value, Enums.ITEM_TYPE.CRAFTING):
			Debug.log_fatal("Incomplete data set: Crafting items")

func verify_equipment_enums() -> void:
	var list = get_enum_list("equipment")
	for enum_value in list:
		if !Data.item_has_data(enum_value, Enums.ITEM_TYPE.EQUIPMENT):
			Debug.log_fatal("Incomplete data set: Equipment items")

func verify_potion_enums() -> void:
	var list = get_enum_list("potion")
	for enum_value in list:
		if !Data.item_has_data(enum_value, Enums.ITEM_TYPE.POTION):
			Debug.log_fatal("Incomplete data set: Potion items")

func verify_provision_enums() -> void:
	var list = get_enum_list("provision")
	for enum_value in list:
		if !Data.item_has_data(enum_value, Enums.ITEM_TYPE.PROVISION):
			Debug.log_fatal("Incomplete data set: Provision items")

func verify_tool_enums() -> void:
	var list = get_enum_list("tool")
	for enum_value in list:
		if !Data.item_has_data(enum_value, Enums.ITEM_TYPE.TOOL):
			Debug.log_fatal("Incomplete data set: Tool items")

func verify_valuable_enums() -> void:
	var list = get_enum_list("valuable")
	for enum_value in list:
		if !Data.item_has_data(enum_value, Enums.ITEM_TYPE.VALUABLE):
			Debug.log_fatal("Incomplete data set: Valuable items")

func verify_weapon_enums() -> void:
	var list = get_enum_list("weapon")
	for enum_value in list:
		if !Data.item_has_data(enum_value, Enums.ITEM_TYPE.WEAPON):
			Debug.log_fatal("Incomplete data set: Weapon items")



func get_enum_value(enum_list_name: String, enum_value_name: String) -> int:
	var list = enum_list[enum_list_name]
	return list[enum_value_name]


func get_enum_list(enum_list_name: String) -> Dictionary:
	var list = enum_list[enum_list_name]
	return list