extends Node2D
 
var used_tiles:Array[Vector2i] = []

func _ready():
		# 2,1 do 2,9
	for y in range(1, 10):           # 1…9
		used_tiles.append(Vector2i(2, y))

	# 3,1 do 5,1
	for x in range(3, 6):            # 3,4,5
		used_tiles.append(Vector2i(x, 1))

	# 6,1 do 6,9
	for y in range(1, 10):           # 1…9
		used_tiles.append(Vector2i(6, y))

	# 7,5
	used_tiles.append(Vector2i(7, 5))

	# 8,6 do 8,8
	for y in range(6, 9):            # 6,7,8
		used_tiles.append(Vector2i(8, y))

	# 9,8 do 11,8
	for x in range(9, 12):           # 9,10,11
		used_tiles.append(Vector2i(x, 8))

	# 12,8 do 12,6 (malejąco)
	for y in range(8, 5, -1):        # 8,7,6
		used_tiles.append(Vector2i(12, y))

	# 13,6 do 16,6
	for x in range(13, 17):          # 13,14,15,16
		used_tiles.append(Vector2i(x, 6))

	# 16,5 do 16,3 (malejąco)
	for y in range(5, 2, -1):        # 5,4,3
		used_tiles.append(Vector2i(16, y))

	# 17,3
	used_tiles.append(Vector2i(17, 3))

	# 14,5
	used_tiles.append(Vector2i(14, 5))

	# 12,4 do 14,4
	for x in range(12, 15):          # 12,13,14
		used_tiles.append(Vector2i(x, 4))

	# 12,3
	used_tiles.append(Vector2i(12, 3))

	# 8,2 do 12,2
	for x in range(8, 13):           # 8,9,10,11,12
		used_tiles.append(Vector2i(x, 2))

	# 8,1 i 8,0 (pojedyncze)
	used_tiles.append(Vector2i(8, 1))
	used_tiles.append(Vector2i(8, 0))
	used_tiles.append(Vector2i(8, 5))
 
func get_tiles(layer : TileMapLayer, selected_tile : Vector2i, tile_pos : Vector2i):
	var source_id = layer.get_cell_source_id(tile_pos)
	var atlas_tile : TileSetAtlasSource
	var tile_size
 
	if source_id != -1:
		atlas_tile = layer.tile_set.get_source(source_id)
	if atlas_tile:
		tile_size = atlas_tile.get_tile_size_in_atlas(selected_tile)
 
	for j in range(tile_size.y):
		for i in range(tile_size.x):
			var tile = tile_pos + Vector2i(i,j)
			if tile not in used_tiles:
				used_tiles.append(tile)
 

 
