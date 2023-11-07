extends Control

var screen_size # Size of the game window.

var game_scene_path = "res://Game/game.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = self.get_viewport_rect().size


func _on_start_button_pressed():
	self.get_tree().change_scene_to_file(game_scene_path)


func _on_exit_button_pressed():
	self.get_tree().quit()
