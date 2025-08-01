extends Node

var hp:int
var gold:int

signal on_hp_change(amount)
signal on_gold_change(amount)

func	 _ready():
	hp = 100
	gold = 100
	pass
	
func add_gold(amount):
	if amount > 0:
		gold += amount
		on_gold_change.emit(gold)
	pass
func remove_gold(amount):
	if amount > 0:
		gold -= amount
		on_gold_change.emit(gold)
	pass
func add_hp(amount):
	if amount > 0:
		hp += amount
		on_hp_change.emit(hp)
	pass
func remove_hp(amount):
	if amount > 0:
		hp -= amount
		on_hp_change.emit(hp)
	pass
