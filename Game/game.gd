extends Node


var main_menu_scene_path = "res://MainMenu/main_menu_gui.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_death():
	self.get_tree().call_group("Mobs", "queue_free")
	self.get_tree().change_scene_to_file(main_menu_scene_path)
