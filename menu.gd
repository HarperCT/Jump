extends Node2D


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Game/game.tscn")


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Options/options.tscn")


func _on_quit_pressed():
	get_tree().quit()
