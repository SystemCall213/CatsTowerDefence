extends Node2D
 
@onready var ground = $Ground
@onready var preview = $Preview
@onready var catScene = load("res://Scenes/Entities/Cats/Cat.tscn")
var source_id : int
var selected_tile : Vector2i
 
var select_mode : bool = false
var preview_tile : Vector2i:
	set(value):
		if preview_tile == value:
			return
 
		preview.erase_cell(preview_tile)
		preview_tile = value
		preview.set_cell(value, source_id, selected_tile)
 
		var atlas_tile : TileSetAtlasSource
		atlas_tile = preview.tile_set.get_source(source_id)
		var tile_size
		if atlas_tile:
			tile_size = atlas_tile.get_tile_size_in_atlas(selected_tile)
			print(tile_size)
		placeable = true
		for j in range(tile_size.y):
			for i in range(tile_size.x):
				var tile = preview_tile + Vector2i(i,j)
				if tile in BuildingManager.used_tiles:
					placeable = false
 
var placeable : bool = true:
	set(value):
		placeable = value
 
		if value == false:
			preview.modulate = Color.RED
		else:
			preview.modulate = Color("ffffff6f")
 
func get_snapped_position(global_pos: Vector2) -> Vector2i:
	var local_pos = ground.to_local(global_pos)
	var tile_pos = ground.local_to_map(local_pos)
 
	return tile_pos
 
func _physics_process(_delta):
	if select_mode:
		preview_tile = get_snapped_position(get_global_mouse_position())
 
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and select_mode and placeable:
			place_tile(preview_tile)
			select_mode = false
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			ground.erase_cell(preview_tile)
 
 
func on_button_pressed(next_cat_id:Vector2i)->void:
	select_mode = true
	selected_tile = next_cat_id
	pass
 
func place_tile(tile_pos: Vector2i):
	var placed_cat = catScene.instantiate()
	
	var world_pos = ground.map_to_local(tile_pos)
	placed_cat.position = world_pos  
	placed_cat.add_example_attack_list()
	Player.cat_mode = true
	Player.current_cat = placed_cat
	add_child(placed_cat)
	
	ground.set_cell(tile_pos, source_id, selected_tile)
	preview.erase_cell(tile_pos)
	BuildingManager.get_tiles(ground, selected_tile, preview_tile)
 
func get_sprite_from_atlas(source_id: int, atlas_coords: Vector2i) -> Sprite2D:
	var source = ground.tile_set.get_source(source_id)

	if source is TileSetAtlasSource:
		var texture = source.get_texture()
		var region = source.get_tile_texture_region(atlas_coords)

		var sprite := Sprite2D.new()
		sprite.texture = texture
		sprite.region_enabled = true
		sprite.region_rect = region

		return sprite
	else:
		printerr("ełłoł -><- coś posrane >.<")
		return null
