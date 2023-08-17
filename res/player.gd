extends Node2D

const Tank = preload("res://res/tank.gd")
const BulletScript = preload("res://res/bullet.gd")

signal is_dead

var tank: Tank
var id: String

func init_player(id):
	self.id = id
	

func _ready():
	print("_ready", "t_player{id}".format({"id": id}))
	tank = get_node("Tank")
	tank.set_max_bullet(3)
	tank.set_sprite("t_player{id}".format({"id": id}))


func _process(delta):
	if Input.is_action_just_pressed("P{id}_SHOOT".format({"id": id})):
		tank.shot(BulletScript.BulletSource.PLAYER)

func _physics_process(delta):
	var speed = 80.0
	var move = false
	if Input.is_action_pressed("P{id}_UP".format({"id": id})):
		tank.set_direction(Vector2.UP)
		move = true
	elif Input.is_action_pressed("P{id}_DOWN".format({"id": id})):
		tank.set_direction(Vector2.DOWN)
		move = true
	elif Input.is_action_pressed("P{id}_LEFT".format({"id": id})):
		tank.set_direction(Vector2.LEFT)
		move = true
	elif Input.is_action_pressed("P{id}_RIGHT".format({"id": id})):
		tank.set_direction(Vector2.RIGHT)
		move = true
	
	if move:
		tank.move(delta)

func _on_tank_bullet_hit(source: BulletScript.BulletSource):
	if source == BulletScript.BulletSource.ENEMY:
		emit_signal("is_dead")
		queue_free()
	else:
		# friendly fire
		pass
