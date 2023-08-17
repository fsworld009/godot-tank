extends CharacterBody2D

signal disappear

var tank_id: String
var direction: Vector2

func init_bullet(direction: Vector2, tank_id: String):
	self.direction = direction
	self.tank_id = tank_id	# 1: Player1, 2: Player2, 3: Enemy

func _physics_process(delta):
	var pos = Vector2()
	var speed = 150
	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		var obj = collision.get_collider()
		obj.emit_signal("bullet_hit", tank_id)		
		emit_signal("disappear")
		queue_free()
