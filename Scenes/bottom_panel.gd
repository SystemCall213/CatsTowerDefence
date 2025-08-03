extends Control

@onready var cat_placement = $CatPlacement
var tilemap_size :int = 3
var selected_cat :int
@onready var gold_label = $GoldLabel
@onready var hp_label = $HpLabel
@onready var progress_bar = $ProgressBar


func _ready():
	generate_new_cat()
	updateManaProgressBar(100)
	


func _on_button_button_down():
	BuildingScene.on_button_pressed(selected_cat, Vector2i(0,0))
	generate_new_cat()
	
	
func generate_new_cat():
	#generate new number for vector for cat
	var rand_nmb = 0
	if BuildingScene.source_size > 0:
		rand_nmb = randi_range(0, BuildingScene.source_size - 1)
	#get new cat

	
	var cat_sprite = BuildingScene.get_sprite_from_atlas(rand_nmb)
	selected_cat = rand_nmb
	#set sprite in the button

	if cat_sprite:
		cat_placement.texture = cat_sprite.texture
		cat_placement.region_enabled = true
		cat_placement.region_rect = cat_sprite.region_rect

func updateHpLabel(amount:int):
	hp_label.text = str(amount)
	pass
func updateGoldLabel(amount:int):
	gold_label.text = str(amount)
	pass
func updateManaProgressBar(amount:int):
	progress_bar.value = amount
	pass
func updateMaxManaProgressBar(amount:int):
	progress_bar.max_value = amount
	pass
