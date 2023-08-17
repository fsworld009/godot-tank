extends CharacterBody2D

signal bullet_hit

func _ready():
	connect("bullet_hit", self._on_bullet_hit)

func _on_bullet_hit(source):
	print('_on_bullet_hit is called', source)
	queue_free()
