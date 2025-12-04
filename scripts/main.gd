extends Node2D
var ENEMY = preload("res://scenes/RayLewis.tscn")
const ENEMY_POSITIONS: Array[Vector2] = [Vector2(100,360), Vector2(300, 720)]

func _ready():
	spawn_enemy()


func _process(_delta: float) -> void:
	pass


func spawn_enemy():
	var enemy = ENEMY.instantiate()
	add_child(enemy)
	
	var i = 0
	for pos in ENEMY_POSITIONS:
		enemy.position = ENEMY_POSITIONS[i]
		# print(i, pos, ENEMY_POSITIONS[i], )
		
		i += 1


func _on_timer_timeout():
	pass
