@tool
extends Node2D


@export var item_type = ""
@export var item_name = ""
@export var item_texture: Texture
@export var item_effect = ""
var scene_path: String = "res://scenes/inventory_item.tscn"

@onready var icon_sprite = $Sprite2D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		icon_sprite.texture = item_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
	if  Engine.is_editor_hint():
		icon_sprite.texture = item_texture
		
	if player_in_range and Input.is_action_just_pressed("add"):
		pickup_item()

func pickup_item():
	var item = {
		"quantity" : 1,
		"type" : item_type,
		"name" : item_name,
		"texture" : item_texture,
		"effect" : item_effect
	}
	if Global.player_node:
		Global.add_item(item)
		self.queue_free()

func _on_area_2d_body_entered(body):
	player_in_range = true
	body.interact_ui.visible = true

func _on_area_2d_body_exited(body):
	player_in_range = false
	body.interact_ui.visible = false

func set_item_data(data):
	item_type = data["type"]
	item_name = data["name"]
	item_effect = data["effect"]
	item_texture = data["texture"]
