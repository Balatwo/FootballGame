extends Timer

# Variables for Enemy Data 
var ENEMY = preload("res://scenes/RayLewis.tscn")
const ENEMY_POSITIONS: Array[Vector2] = [
	Vector2(100, 360),
	Vector2(300, 720),
	Vector2(500, 100),
	Vector2(700, 540),
	Vector2(250, 200),
	Vector2(100, 360),
	Vector2(300, 720),
	Vector2(500, 100),
	Vector2(700, 540),
	Vector2(250, 200),
	Vector2(100, 360),
	Vector2(300, 720),
	Vector2(500, 100),
	Vector2(700, 540),
	Vector2(250, 200),
	Vector2(100, 360),
	Vector2(300, 720),
	Vector2(500, 100),
	Vector2(700, 540),
	Vector2(250, 200),
]

func _on_time_timer_timeout():
	spawn_next_enemy()
	
# Variables for Timer Control
const SPAWN_DELAY: float = 2 # Time in seconds between spawns
var current_enemy_index: int = 0
var spawn_timer: Timer

func _ready():
	# Create a new Timer node
	spawn_timer = Timer.new()
	#  Set how long it should wait
	spawn_timer.wait_time = SPAWN_DELAY
	# Add the Timer to the scene tree
	add_child(spawn_timer)
	spawn_timer.connect("timeout", _on_time_timer_timeout)
	#  Start the process
	start_timed_spawning()
	
func start_timed_spawning():
	if ENEMY_POSITIONS.size() > 0:
		spawn_timer.start()
		# Immediately spawn the first enemy so there's no initial delay
		spawn_next_enemy()

func spawn_next_enemy():
	# Check if we have processed all positions
	if current_enemy_index >= ENEMY_POSITIONS.size():
		# Stop the timer when all enemies are spawned
		spawn_timer.stop()
		print("All enemies have been spawned.")
		return
		
	#  Get the current position from the array
	var pos = ENEMY_POSITIONS[current_enemy_index]
	
	# Instantiate and set up the enemy 
	var enemy = ENEMY.instantiate()
	add_child(enemy)
	enemy.position = pos
	
	# Move to the next index for the next spawn
	current_enemy_index += 1

func _on_spawn_timer_timeout():
	spawn_next_enemy()
	
