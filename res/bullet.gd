extends CharacterBody2D

signal disappear

enum BulletSource {
	PLAYER,
	ENEMY
}

var source: BulletSource
var direction: Vector2

func init_bullet(direction: Vector2, source: BulletSource):
	self.direction = direction
	self.source = source

func _physics_process(delta):
	var pos = Vector2()
	var speed = 100
	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		var obj = collision.get_collider()
		print(obj)
		obj.emit_signal("bullet_hit", source)		
		emit_signal("disappear")
		queue_free()
