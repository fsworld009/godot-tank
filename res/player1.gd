extends Node2D

const Tank = preload("res://res/tank.gd")
const BulletScript = preload("res://res/bullet.gd")

var tank: Tank

func _ready():
	tank = get_node("Tank")
	tank.set_max_bullet(3)
	tank.set_sprite("t_player1")

func _process(delta):
	if Input.is_action_just_pressed("P1_SHOOT"):
		tank.shot(BulletScript.BulletSource.PLAYER)

func _physics_process(delta):
	var speed = 40.0
	var move = false
	if Input.is_action_pressed("P1_UP"):
		tank.set_direction(Vector2.UP)
		move = true
	elif Input.is_action_pressed("P1_DOWN"):
		tank.set_direction(Vector2.DOWN)
		move = true
	elif Input.is_action_pressed("P1_LEFT"):
		tank.set_direction(Vector2.LEFT)
		move = true
	elif Input.is_action_pressed("P1_RIGHT"):
		tank.set_direction(Vector2.RIGHT)
		move = true
	
	if move:
		tank.move(delta)
