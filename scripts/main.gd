extends Node2D
var ENEMY = preload("res://scenes/RayLewis.tscn")
# Variable to hold the time survived in seconds
var survival_time: float = 0.0
# Get the Timer and Label nodes
@onready var survival_timer = $Scorecount
@onready var score_label = $Scoreboard/Scorelabel 
@onready var spawn_timer = $"Enemy Timer"
@onready var player = $Player
const SPAWN_INTERVAL: float = 2.0 # enemy spawn time
const SPAWN_DISTANCE: float = 500.0 # Eistance from the player to spawn


func _ready(): 
	spawn_timer.wait_time = SPAWN_INTERVAL
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	spawn_timer.start()
	survival_timer.start()
	
func _on_spawn_timer_timeout():
	spawn_enemy_at_random_location()

func spawn_enemy_at_random_location():
	# 1. Get a random angle (0 to 360 degrees, in radians)
	var random_angle = randf_range(0, 2 * PI)
	
	# 2. Calculate a random position far from the player
	# Vector2.RIGHT is (1, 0). Rotated by the angle, it points outwards.
	var spawn_offset = Vector2.RIGHT.rotated(random_angle) * SPAWN_DISTANCE
	
	# 3. Determine the final spawn position (relative to the player)
	var spawn_pos = player.global_position + spawn_offset
	
	# 4. Instantiate and add the enemy
	var enemy = ENEMY.instantiate()
	add_child(enemy)
	enemy.global_position = spawn_pos

func _process(delta):
	if survival_timer.is_stopped():
		return
	# Accumulate time
	survival_time += delta
	# Format the time to a string (e.g., 15.45)
	score_label.text = "Time: " + ("%.2f" % survival_time)
	
func _on_player_died():
	# 1. Stop the survival timer
	survival_timer.stop()
