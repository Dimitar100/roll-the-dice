extends Node2D

var dots6 = 0
var dots5 = 0
var dots1 = 0
var dots2 = 0
var dots3 = 0
var dots4 = 0

var dots = ["1", "2", "3", "4","5", "6"]
var i = 5
var can_up = true
var can_down = true
var can_right = true
var can_left = true

func up_dots():#left 45 deg
	if i == 5:
		i = 0
	else:
		i += 1
	get_node("AnimatedSprite").play(dots[i])

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass
		
	

