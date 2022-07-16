extends Node2D

var dots6 = 0
var dots5 = 0
var dots1 = 0
var dots2 = 0
var dots3 = 0
var dots4 = 0

var y = ["6", "5", "1", "2","6", "5","1"]
var yi = 0
var x = ["6", "3", "1", "4", "6", "3", "1", "4", "6"]
var xi = 0

var can_up = true
var can_down = true
var can_right = true
var can_left = true

var dots = dots6

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
		yi += 1
		get_node("AnimatedSprite").play(y[yi])
		if y[yi]=="6":
			for n in 9:
				if n==0 || n==4 || n==8:
					x[n] = "6"
				elif n==2 || n==6:
					x[n] = "1"
		elif y[yi]=="5":
			for n in 9:
				if n==0 || n==4 || n==8:
					x[n] = "5"
				elif n==2 || n==6:
					x[n] = "2"
		elif y[yi]=="1":
			for n in 9:
				if n==0 || n==4 || n==8:
					x[n] = "1"
				elif n==2 || n==6:
					x[n] = "6"
		elif y[yi]=="2":
			for n in 9:
				if n==0 || n==4 || n==8:
					x[n] = "2"
				elif n==2 || n==6:
					x[n] = "5"
	elif Input.is_action_just_pressed("ui_down") && can_down:
		yi -= 1
		get_node("AnimatedSprite").play(y[yi])
		if y[yi]=="6":
			for n in 9:
				if n==0 || n==4 || n==8:
					x[n] = "6"
				elif n==2 || n==6:
					x[n] = "1"
		elif y[yi]=="5":
			for n in 9:
				if n==0 || n==4 || n==8:
					x[n] = "5"
				elif n==2 || n==6:
					x[n] = "2"
		elif y[yi]=="1":
			for n in 9:
				if n==0 || n==4 || n==8:
					x[n] = "1"
				elif n==2 || n==6:
					x[n] = "6"
		elif y[yi]=="2":
			for n in 9:
				if n==0 || n==4 || n==8:
					x[n] = "2"
				elif n==2 || n==6:
					x[n] = "5"
	elif Input.is_action_just_pressed("ui_right") && can_right:
		xi += 1
		get_node("AnimatedSprite").play(x[xi])
		if x[xi]=="6":
			for n in 9:
				if n==1 || n==5:
					y[n] = "6"
				elif n==3:
					y[n] = "1"
		elif x[xi]=="3":
			for n in 9:
				if n==1 || n==5:
					y[n] = "3"
				elif n==3:
					y[n] = "4"
		elif x[xi]=="1":
			for n in 9:
				if n==1 || n==5:
					y[n] = "1"
				elif n==3:
					y[n] = "6"
		elif x[xi]=="4":
			for n in 9:
				if n==1 || n==5:
					y[n] = "4"
				elif n==3:
					y[n] = "3"
	elif Input.is_action_just_pressed("ui_left") && can_left:
		xi -= 1
		get_node("AnimatedSprite").play(x[xi])
		if x[xi]=="6":
			for n in 9:
				if n==1 || n==5:
					y[n] = "6"
				elif n==3:
					y[n] = "1"
		elif x[xi]=="3":
			for n in 9:
				if n==1 || n==5:
					y[n] = "3"
				elif n==3:
					y[n] = "4"
		elif x[xi]=="1":
			for n in 9:
				if n==1 || n==5:
					y[n] = "1"
				elif n==3:
					y[n] = "6"
		elif x[xi]=="4":
			for n in 9:
				if n==1 || n==5:
					y[n] = "4"
				elif n==3:
					y[n] = "3"
		
