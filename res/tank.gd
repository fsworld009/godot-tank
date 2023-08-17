extends CharacterBody2D

const Bullet = preload("res://res/bullet.tscn")

var bullet_count = 0
var direction = Vector2.UP

signal on_collision
signal bullet_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_bullet_disappear():
	bullet_count -= 1

var max_bullet = 1
var speed = 40

func set_direction(direction: Vector2):
	self.direction = direction
	var rotation_degree: float
	match direction:
		Vector2.UP:
			rotation_degree = 0
		Vector2.RIGHT:
			rotation_degree = 90
		Vector2.DOWN:
			rotation_degree = 180
		Vector2.LEFT:
			rotation_degree = 270
	self.rotation = deg_to_rad(rotation_degree)

func get_direction():
	return direction

func move(delta):
	var collision = self.move_and_collide(speed * direction * delta)
	if collision:
		emit_signal("on_collision", collision)


func set_sprite(sprite: String):
	var sprite2D: Sprite2D = get_node("Sprite2D")
	sprite2D.set_texture(load("res://res/{sprite}.png".format({"sprite": sprite})))

func set_max_bullet(max):
	max_bullet = max

func shot(tank_id: String):
	if bullet_count < max_bullet:
		var root = get_tree().get_root()
		var bullet = Bullet.instantiate()
		bullet.init_bullet(direction, tank_id)
		bullet.position = global_position
		# bullet.position.y = position.y
		match direction:
			Vector2.UP:
				bullet.position.y -= 17
			Vector2.RIGHT:
				bullet.position.x += 17
			Vector2.DOWN:
				bullet.position.y += 17
			Vector2.LEFT:
				bullet.position.x -= 17
		bullet.connect("disappear", _on_bullet_disappear)
		bullet.z_index = 1
		root.add_child(bullet)
		bullet_count += 1
