extends Node2D

const Player = preload("res://res/player.tscn")

var lives = 3
var id: String

# Called when the node enters the scene tree for the first time.
func _ready():
	id = get_meta("player_id")
	gen_player()


func gen_player():
	var player = Player.instantiate()
	player.init_player(get_meta("player_id"))
	player.connect("is_dead", _on_player_is_dead)
	add_child(player)


func _on_player_is_dead():
	lives -= 1
	if lives > 0:
		$Timer.start()
	else:
		# emit player 1 gameover
		pass

func _on_timer_timeout():
	gen_player()
