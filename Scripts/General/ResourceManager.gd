extends Node

var hp:int
var gold:int
var mana_max: int  = 100 
var mana: float = mana_max

@export var mana_regen_rate: float = 5.0

signal on_hp_change(amount)
signal on_gold_change(amount)
signal on_mana_change(amount)
signal on_max_mana_change(amount)

func	 _ready():
	hp = 100
	gold = 100
	pass
	
func _process(delta):
	_regenerate_mana(delta)
	
func _regenerate_mana(delta):
	if mana >= mana_max:
		return

	var old_mana = mana
	mana = clamp(mana + mana_regen_rate * delta, 0, mana_max)


	if int(mana) != int(old_mana):
		emit_signal("on_mana_change", int(mana))	
func change_max_mana(amount:int):
	mana_max = amount
	on_max_mana_change.emit(mana_max)	
	
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
