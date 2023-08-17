extends Node2D

const Player = preload("res://res/player.tscn")

signal no_more_life

var lifes = 3
var id: String

# Called when the node enters the scene tree for the first time.
func _ready():
	id = get_meta("player_id")
	if id == "2" && Global.players != 2:
		lifes = 0
		emit_signal("no_more_life")
	else:
		gen_player()


func gen_player():
	var player = Player.instantiate()
	player.init_player(get_meta("player_id"))
	player.connect("is_dead", _on_player_is_dead)
	add_child(player)


func _on_player_is_dead():
	lifes -= 1
	if lifes > 0:
		$Timer.start()
	else:
		emit_signal("no_more_life")

func _on_timer_timeout():
	gen_player()
