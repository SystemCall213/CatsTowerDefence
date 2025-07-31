extends Node2D

var cat_mode = false
var current_cat: Cat

func _process(delta):
	if cat_mode:
		if Input.is_action_just_pressed("A"):
			current_cat.combination.add_char("A")
		if Input.is_action_just_pressed("S"):
			current_cat.combination.add_char("S")
		if Input.is_action_just_pressed("D"):
			current_cat.combination.add_char("D")
		if Input.is_action_just_pressed("F"):
			current_cat.combination.add_char("F")
		if Input.is_action_just_pressed("J"):
			current_cat.combination.add_char("J")
		if Input.is_action_just_pressed("K"):
			current_cat.combination.add_char("K")
		if Input.is_action_just_pressed("L"):
			current_cat.combination.add_char("L")
		if Input.is_action_just_pressed("SPACE"):
			current_cat.combination.execute()
			cat_mode = false
		
