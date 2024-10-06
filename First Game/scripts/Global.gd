extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var inventory = []

signal inventory_updated

var player_node: Node = null
@onready var inventory_slot_secene = preload("res://scenes/inventory_slot.tscn")

func _ready():
	inventory.resize(30)

func add_item(item):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["type"] == item["type"] and inventory[i]["effect"] == item["effect"]:
			inventory[i]["quantity"] += item["quantity"]
			inventory_updated.emit()
			print("Item added ", inventory)
			return true
		elif inventory[i] == null:
			inventory[i] = item
			inventory_updated.emit()
			print("Item added ", inventory)
			return true
	return true

func increase_inventory_size():
	inventory_updated.emit()

func set_player_reference(player):
	player_node = player

func remove_item(item_type, item_effect):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["type"] == item_type and inventory[i]["effect"] == item_effect:
			inventory[i]["quantity"] -= 1
			if inventory[i]["quantity"] <= 0:
				inventory[i] = null
			print("Item removed ", inventory)
			inventory_updated.emit()
			return true
	return false

func drop_item(item_data, drop_position):
	var item_scene = load("res://scenes/inventory_item.tscn")
	var item_instance = item_scene.instantiate()
	item_instance.set_item_data(item_data)
	item_instance.global_position = drop_position
	get_tree().current_scene.add_child(item_instance)
