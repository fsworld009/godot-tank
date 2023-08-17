extends Node2D

var option: int

# Called when the node enters the scene tree for the first time.
func _ready():
	option = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	var arrow_text: String
	match option:
		0:
			arrow_text = ">"
		1:
			arrow_text = "\n>"
		2:
			arrow_text = "\n\n>"
	$ArrowLabel.text = arrow_text
	
	if Input.is_action_just_pressed("P1_DOWN") or Input.is_action_just_pressed("P2_DOWN"):
		option = (option + 1) % 3
	elif Input.is_action_just_pressed("P1_UP") or Input.is_action_just_pressed("P2_UP"):
		option -= 1
		if (option < 0):
			option = 2
	elif Input.is_action_just_pressed("P1_SHOOT") or Input.is_action_just_pressed("P2_SHOOT"):
		match option:
			0:
				Global.players = 1
				get_tree().change_scene_to_file("res://res/game.tscn")
			1:
				Global.players = 2
				get_tree().change_scene_to_file("res://res/game.tscn")
			2:
				get_tree().quit()
				
