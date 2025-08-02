extends Control

@onready var bottom_panel = $CanvasLayer/VBoxContainer/HBoxContainer/Control
@onready var timeline = $CanvasLayer/VBoxContainer/Timeline



func _ready():
	# Podpięcie do globalnych sygnałów
	ResourceManager.connect("on_hp_change", Callable(self, "_on_hp_change"))
	ResourceManager.connect("on_gold_change", Callable(self, "_on_gold_change"))
	ResourceManager.connect("on_mana_change", Callable(self, "_on_mana_change"))

func _on_hp_change(value: int):
	bottom_panel.updateHpLabel(value)

func _on_gold_change(value: int):
	bottom_panel.updateGoldLabel(value)
func _on_mana_change(value:int):
	bottom_panel.updateManaProgressBar(value)
func _on_max_mana_change(value:int):
	bottom_panel.updateMaxManaProgressBar(value)
