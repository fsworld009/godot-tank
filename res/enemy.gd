extends Node2D

const Tank = preload("res://res/tank.gd")
const BulletScript = preload("res://res/bullet.gd")

var tank: Tank
var wait_timer: Timer
var move_timer: Timer
var oncollision_timer: Timer
var shot_timer: Timer
var rng = RandomNumberGenerator.new()

func _ready():
	tank = get_node("Tank")
	tank.set_max_bullet(1)
	tank.set_sprite("t_enemy")
	wait_timer = $WaitTimer
	move_timer = $MoveTimer
	oncollision_timer = $OnCollisionTimer
	shot_timer = $ShotTimer
	turn()
	set_move_timer()
	set_shot_timer()

func _on_wait_timer_timeout():
	print("wait timeout")
	turn()
	set_move_timer()

func _on_move_timer_timeout():
	print("move timeout")
	set_wait_timer()

func _process(delta):
	pass
#	if Input.is_action_just_pressed("P1_SHOOT"):
#		tank.shot()

func turn():
	var rand_direction = rng.randi_range(0, 3)
	match rand_direction:
		0:
			tank.set_direction(Vector2.UP)
		1:
			tank.set_direction(Vector2.RIGHT)
		2:
			tank.set_direction(Vector2.DOWN)
		3:
			tank.set_direction(Vector2.LEFT)

func set_move_timer():
	move_timer.start(rng.randf_range(1, 5))

func set_wait_timer():
	wait_timer.start(rng.randf_range(0.5, 3))

func set_shot_timer():
	shot_timer.start(rng.randf_range(2, 6))

func _physics_process(delta):
	if !move_timer.is_stopped():
		tank.move(delta)


func _on_tank_on_collision(collision: KinematicCollision2D):
	oncollision_timer.start(rng.randf_range(0.1, 1))
#	var cname = collision.get_collider().get_class()
#	if cname == 'TileMap':
#		# Get local position relative to tilemap
#		var tilemap: TileMap = collision.get_collider()
#		var collision_position = collision.get_position()
#
#		var local_position = tilemap.to_local(collision.get_position())
#		# Offset based on direction:
#		match tank.get_direction():
#			Vector2.UP:
#				local_position.y -= 1
#			Vector2.RIGHT:
#				local_position.x += 1
#			Vector2.DOWN:
#				local_position.y += 1
#			Vector2.LEFT:
#				local_position.x -= 1
#		# Find out which tile it collides to
#		var tile_data: TileData = tilemap.get_cell_tile_data(
#			0,tilemap.local_to_map(local_position))
#		if tile_data and tile_data.get_custom_data("isBlock"):
#			print('hit wall')
#			turn()

func _on_on_collision_timer_timeout():
	turn()


func _on_shot_timer_timeout():
	tank.shot(BulletScript.BulletSource.ENEMY)
	set_shot_timer()
