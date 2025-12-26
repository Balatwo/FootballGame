extends CharacterBody2D

@onready var target = get_tree().get_first_node_in_group("player")
var speed = 250
var turn_speed = 8.0

func _physics_process(delta):
	
	if not target:
		return
	
	#makes the player the target and tells it it's location
	var target_pos = target.global_position   
	var direction = (target_pos - global_position).normalized()   
	
	#moves the enemy to the player
	velocity = direction * speed
	move_and_slide()

	#makes the enemy look at the target
	rotation = lerp_angle(rotation, direction.angle(), turn_speed * delta)

func on_tackle(body: Node2D):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
