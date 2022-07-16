extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_LvlBtn_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Level1.tscn")
