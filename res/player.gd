extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = Vector2()
	var speed = 10.0
	if Input.is_action_pressed("P1_UP"):
		pos.y = -speed * delta
	elif Input.is_action_pressed("P1_DOWN"):
		pos.y = speed * delta
	elif Input.is_action_pressed("P1_LEFT"):
		pos.x = -speed * delta
	elif Input.is_action_pressed("P1_RIGHT"):
		pos.x = speed * delta
	self.move_and_collide(pos)
	
