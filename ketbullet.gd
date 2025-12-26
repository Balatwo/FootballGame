extends CharacterBody2D
var pos:Vector2
var dir : float
var speed = 800 
var travel_velocity: Vector2

func _ready():
	global_position = pos
	rotation = dir
	travel_velocity = Vector2.RIGHT.rotated(dir) * speed
	

func _physics_process(_delta):
	velocity = travel_velocity
	# Check for collision
	if move_and_slide():
		# Get the first thing we hit
		var collision = get_slide_collision(0)
		var body = collision.get_collider()
		if body.is_in_group("enemy"):
			print("Enemy hit!")
			body.queue_free() 
			queue_free()       # Destroy the bullet
