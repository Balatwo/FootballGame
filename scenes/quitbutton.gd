extends Button
const path := "res://scenes/main.tscn"

func _on_pressed() -> void:
	get_tree().quit()
