extends CharacterBody2D

const Bullet = preload("res://res/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("P1_SHOOT"):
		print("Pressed")
		var bullet = Bullet.instantiate()
		get_parent().add_child(bullet)
		bullet.z_index = 1
		bullet.position.x = position.x
		bullet.position.y = position.y -24

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var pos = Vector2()
	var speed = 40.0
	#var sprite2D: Sprite2D = self.get_parent().get_node("Sprite2D");
	if Input.is_action_pressed("P1_UP"):
		rotation = 0
		pos.y = -speed * delta
	elif Input.is_action_pressed("P1_DOWN"):
		rotation = deg_to_rad(180)
		pos.y = speed * delta
	elif Input.is_action_pressed("P1_LEFT"):
		rotation = deg_to_rad(270)
		pos.x = -speed * delta
	elif Input.is_action_pressed("P1_RIGHT"):
		rotation = deg_to_rad(90)
		pos.x = speed * delta
	self.move_and_collide(pos)

