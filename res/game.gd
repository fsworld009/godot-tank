extends Node2D


var enemy_list
var p1_live_label: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	p1_live_label = $UI/P1LiveLabel
	print(p1_live_label)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	p1_live_label.text = str($Generators/Player1Generator.lives)
