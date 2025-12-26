extends CharacterBody2D

const WALK_SPEED := 300
const path := "res://death.tscn"
var look
const BULLET_PATH = "res://ketbullet.tscn" 

const HALF_CIRCLE = PI

func fire():
	# ... (your bullet loading and instantiation logic) ...
	var bullet_resource = load(BULLET_PATH) 
	if bullet_resource == null:
		return
	var bullet = bullet_resource.instantiate()
	var corrected_direction = fmod(rotation + 2 * HALF_CIRCLE, 2 * HALF_CIRCLE)
	bullet.dir = corrected_direction
	bullet.pos = global_position 
	get_parent().add_child(bullet)

func _physics_process(_delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("attack"):
		fire()
	var input_vector: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	#gives it a speed to be able to move
	velocity = input_vector * WALK_SPEED
	
	move_and_slide()



func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if not body.is_in_group("enemy"):
		return
	get_tree().change_scene_to_file(path)
	
