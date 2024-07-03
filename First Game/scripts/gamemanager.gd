extends Node2D

var score = 0
var midground_layer = 1

@onready var tile_map : TileMap = $"../TileMap"
@onready var score_label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."

func _input(event):
	# Mouse in viewport coordinates.
	if Input.is_action_just_pressed("click"):
		var mouse_pos = get_global_mouse_position()
		print("Global mouse pos: ", mouse_pos)
		
		var tile_mouse_pos = tile_map.local_to_map(mouse_pos)
		print("TileMap mouse pos: ", tile_mouse_pos)
		
		var source_id = 0
		var atlas_coord = Vector2i(0, 1)
		
		tile_map.set_cell(midground_layer, tile_mouse_pos, source_id, atlas_coord)

