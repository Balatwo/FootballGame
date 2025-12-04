extends CharacterBody2D

const WALK_SPEED = 300


func _physics_process(_delta: float) -> void:
	var input_vector: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	velocity = input_vector * WALK_SPEED
	
	move_and_slide()
