extends Node2D

var Enemy = preload("res://res/enemy.tscn")
var enemy_count = 5;
var enemy = null
var rng = RandomNumberGenerator.new()

signal no_more_enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_children())
	gen_enemy()

func gen_enemy():
	enemy = Enemy.instantiate()
	enemy.connect("is_dead", _on_enemy_is_dead)
	add_child(enemy)

func set_timer():
	$Timer.start(rng.randf_range(1, 4.5))
	
func _on_enemy_is_dead():
	enemy_count -= 1
	if enemy_count > 0:
		set_timer()
	else:
		emit_signal("no_more_enemy")

func _on_timer_timeout():
	gen_enemy()
