extends Node
class_name CurrentWaveSpawnerInfo

@onready var sprite: TextureRect = $DogSprite
@onready var hp: RichTextLabel = $StatsContainer/HP
@onready var speed: RichTextLabel = $StatsContainer/Speed
@onready var damage: RichTextLabel = $StatsContainer/Damage
@onready var count: RichTextLabel = $StatsContainer/Count

func set_info(_sprite: Sprite2D, _hp: int, _speed: float, _damage: int, _count: int):
	sprite.texture = _sprite.texture
	hp.text = "hp: " + str(_hp)
	speed.text = "speed: " + str(_speed)
	damage.text = "damage: " + str(_damage)
	count.text = "count: " + str(_count)
