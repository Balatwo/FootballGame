extends Node2D
@onready var final_score_label = $FinalScoreLabel 

func _on_button_pressed() -> void:
	#sends to main menu
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	


func _on_quit_pressed() -> void:
	#ends the game
	get_tree().quit()
