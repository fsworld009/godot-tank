extends CharacterBody2D

signal bullet_hit

func _ready():
	connect("bullet_hit", self._on_bullet_hit)
	set_meta('wall', 'true')

func _on_bullet_hit(source):
	queue_free()
