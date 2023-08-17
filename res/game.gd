extends Node2D


var enemy_list
var p1_live_label: Label
var enemies_count_label: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	p1_live_label = $UI/P1LiveLabel
	enemies_count_label = $UI/EnemiesCountLabel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	p1_live_label.text = str($PlayerGenerators/Player1Generator.lives)
	var enemies = 0
	for generator in $EnemyGenerators.get_children():
		enemies += generator.enemy_count
	enemies_count_label.text = str(enemies)
	
