extends Node2D

var dice1
var dice2
var dots = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10","11", "12"]

func generate_random():
	dice1 = randi() % 6
	dice2 = randi() % 6
	get_node("dice1").play(dots[dice1])
	get_node("dice2").play(dots[dice2])
	
func swap_colour(dice):
	get_node(dice).play(dots[dice1+6])


func _ready():
	generate_random()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	pass
