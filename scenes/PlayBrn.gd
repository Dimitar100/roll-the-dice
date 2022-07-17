extends TextureButton


func _ready():
	pass # Replace with function body.

func _on_PlayBrn_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Level1.tscn")
