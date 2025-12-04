extends CharacterBody2D

@onready var target = get_node("../Player") 
var speed = 100
var turn_speed = 6.0
 
func _physics_process(delta):
	if not target:
		return

	var target_pos = target.global_position
	var direction = (target_pos - global_position).normalized()
	
	velocity = direction * speed
	move_and_slide()

	rotation = lerp_angle(rotation, direction.angle(), turn_speed * delta)

func death(body: Node) -> void:
	if body.is_in_group("Player"):
	get_tree().change_scene("res://scenes/menu.tscn")

func _on_hitbox_body_entered(body):
	print("Body entered: ", body.name)
	death(body)

func _on_hitbox_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	pass
