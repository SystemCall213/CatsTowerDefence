extends Control

@onready var cat_placement = $ButtonTexture/CatPlacement
var tilemap_size :int = 3
var selected_cat :Vector2i

func _ready():
	generate_new_cat()
	


func _on_button_button_down():
	BuildingScene.on_button_pressed(selected_cat)
	generate_new_cat()
	
	
func generate_new_cat():
	#generate new number for vector for cat
	var rand_nmb = 0
	if tilemap_size > 0:
		rand_nmb = randi_range(0, tilemap_size - 1)
	#get new cat
	var vec = Vector2i(rand_nmb, 0)
	
	var cat_sprite = BuildingScene.get_sprite_from_atlas(0, vec)
	selected_cat = vec
	#set sprite in the button

	if cat_sprite:
		cat_placement.texture = cat_sprite.texture
		cat_placement.region_enabled = true
		cat_placement.region_rect = cat_sprite.region_rect
