extends Node2D

var width = 9
var height = 6


func _ready():
	var matrix = []
	for x in range(width):
		matrix.append([])
# warning-ignore:unused_variable
		for y in range(height):
			matrix[x].append(0)
	
	
	var s = Sprite.new()
	add_child(s,true)
	var field = preload("res://assets/field.png")
	s.set_texture(field)
	s.position.x = 48
	s.position.y = 48
	

	

	




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
