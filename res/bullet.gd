extends CharacterBody2D

func _physics_process(delta):
	var pos = Vector2()
	pos.y = -40 * delta
	var collision = move_and_collide(pos)
	print(position)
	
	if collision:
		var cname = collision.get_collider().get_class()
		match cname:
			_:
				print(cname)
		
		queue_free()
