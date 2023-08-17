extends CharacterBody2D

const Bullet = preload("res://res/bullet.tscn")
const BulletScript = preload("res://res/bullet.gd")

var bullet_count = 0
var direction = Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("P1_SHOOT") && bullet_count < 3:
		print("Pressed")
		var bullet = Bullet.instantiate()
		bullet.init_bullet(direction, BulletScript.BulletSource.PLAYER)
		bullet.z_index = 1
		bullet.position.x = position.x
		bullet.position.y = position.y
		match direction:
			Vector2.UP:
				bullet.position.y -= 24
			Vector2.RIGHT:
				bullet.position.x += 24
			Vector2.DOWN:
				bullet.position.y += 24
			Vector2.LEFT:
				bullet.position.x -= 24
		bullet.connect("disappear", _on_bullet_disappear)
		get_parent().add_child(bullet)
		bullet_count += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var speed = 40.0
	var move = false
	if Input.is_action_pressed("P1_UP"):
		rotation = 0
		direction = Vector2.UP
		move = true
	elif Input.is_action_pressed("P1_DOWN"):
		rotation = deg_to_rad(180)
		direction = Vector2.DOWN
		move = true
	elif Input.is_action_pressed("P1_LEFT"):
		rotation = deg_to_rad(270)
		direction = Vector2.LEFT
		move = true
	elif Input.is_action_pressed("P1_RIGHT"):
		rotation = deg_to_rad(90)
		direction = Vector2.RIGHT
		move = true
	
	if move:
		self.move_and_collide(speed * direction * delta)

func _on_bullet_disappear():
	bullet_count -= 1
