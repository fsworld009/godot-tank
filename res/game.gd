extends Node2D


var enemy_list
var p1_live_label: Label
var p2_live_label: Label
var enemies_count_label: Label
var can_leave_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	p1_live_label = $UI/P1LiveLabel
	p2_live_label = $UI/P2LiveLabel
	enemies_count_label = $UI/EnemiesCountLabel

func get_enemies_count():
	var enemies = 0
	for generator in $EnemyGenerators.get_children():
		enemies += generator.enemy_count
	return enemies

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	p1_live_label.text = str($PlayerGenerators/Player1Generator.lifes)
	p2_live_label.text = str($PlayerGenerators/Player2Generator.lifes)
	
	enemies_count_label.text = str(get_enemies_count())
	
	if can_leave_game && (
		Input.is_action_pressed("P1_SHOOT") or Input.is_action_pressed("P2_SHOOT")):
		get_tree().change_scene_to_file("res://res/main.tscn")
	

func game_over(is_win: bool):
	$UI/GameOverLabels.visible = true
	$UI/GameOverLabels/Result.text = "You Win" if is_win else "You Lose"
	$GameoverTimer.start()

func _on_enemy_generator_no_more_enemy():
	if get_enemies_count() == 0:
		# Win!
		game_over(true)



func _on_player_generator_no_more_life():
	if $PlayerGenerators/Player1Generator.lifes + $PlayerGenerators/Player2Generator.lifes == 0:
		# You lose!
		game_over(false)


func _on_gameover_timer_timeout():
	can_leave_game = true
	$UI/GameOverLabels/GoBackHint.visible = true
