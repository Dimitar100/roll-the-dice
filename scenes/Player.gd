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

func rotate_right(dot):#right 45 deg
	dot += 90
	if dot == 360:
		dot = 0

func rotate_left(dot):#left 45 deg
	dot -= 90
	if dot < 0:
		dot = 270

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_up") && can_up:
		if i == 5:
			i = 0
		else:
			i += 1
		get_node("AnimatedSprite").play(dots[i])
	elif Input.is_action_just_pressed("ui_down") && can_down:
		if i == 5:
			i = 0
		else:
			i += 1
		get_node("AnimatedSprite").play(dots[i])
	elif Input.is_action_just_pressed("ui_right") && can_right:
		if i == 5:
			i = 0
		else:
			i += 1
		get_node("AnimatedSprite").play(dots[i])
	elif Input.is_action_just_pressed("ui_left") && can_left:
		if i == 5:
			i = 0
		else:
			i += 1
		get_node("AnimatedSprite").play(dots[i])
		
	

