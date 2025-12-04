extends Button
var path := "res://scenes/main.tscn"

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
