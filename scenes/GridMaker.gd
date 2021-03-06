extends Node2D

var matrix = []
var matrix_fields = []
var width = 9
var height = 7

var count = 0;

var field = preload("res://assets/field.png")
var dice1 = preload("res://assets/dice_field_red/Dice_field1.png")
var dice2 = preload("res://assets/dice_field_red/Dice_field2.png")
var dice3 = preload("res://assets/dice_field_red/Dice_field3.png")
var dice4 = preload("res://assets/dice_field_red/Dice_field4.png")
var dice5 = preload("res://assets/dice_field_red/Dice_field5.png")
var dice6 = preload("res://assets/dice_field_red/Dice_field6.png")

export var dice1_x_y = [0, 0]
export var dice2_x_y = [0, 0]
export var dice3_x_y = [0, 0]
export var dice4_x_y = [0, 0]
export var dice5_x_y = [0, 0]
export var dice6_x_y = [0, 0]

var player = [6, 0]
var invs
var player_loc

func dice_locations(n):
	var x = randi() % 9
	var y = randi() % 7
	if matrix[x][y] == 0:
		matrix[x][y] = n + 1
	else:
		dice_locations(n)

func setup_grid():
	matrix[player[1]][player[0]] = 7
	var xLoc = 60
	var yLoc = 60
	
	for z in height:
		for i in width:
			var s = Sprite.new()
			add_child(s,true)
			matrix_fields[i][z] = s
			
			if matrix[i][z] == 0 || matrix[i][z] == 7:
				s.set_texture(field)
			elif matrix[i][z] == 1:
				s.set_texture(dice1)
			elif matrix[i][z] == 2:
				s.set_texture(dice2)
			elif matrix[i][z] == 3:
				s.set_texture(dice3)
			elif matrix[i][z] == 4:
				s.set_texture(dice4)
			elif matrix[i][z] == 5:
				s.set_texture(dice5)
			elif matrix[i][z] == 6:
				s.set_texture(dice6)
			else:
				s.visible= false
			
			if matrix[i][z] == 7:
				invs = s
				invs.visible = false
				get_node("Player").position.x = xLoc
				get_node("Player").position.y = yLoc
				player_loc = [xLoc, yLoc]
				
			s.position.x = xLoc
			s.position.y = yLoc
			xLoc = xLoc + 80
		
		
		yLoc = yLoc + 80
		xLoc = 60
		
func turn_dice():
	if int(get_node("Player").get_node("AnimatedSprite").get_animation()) == matrix[player[1]][player[0]]:
		if get_parent().dice1+1 ==matrix[player[1]][player[0]]:
			get_parent().get_node("dice1").play(get_parent().dots[get_parent().dice1+6])
		if get_parent().dice2+1 == matrix[player[1]][player[0]]:
			get_parent().get_node("dice2").play(get_parent().dots[get_parent().dice2+6])	
			
func _ready():
	for x in range(width):
		matrix.append([])
		matrix_fields.append([])
# warning-ignore:unused_variable
		for y in range(height):
			matrix[x].append(0)
			matrix_fields[x].append(0)
	
	for n in 6:
		dice_locations(n)
	#matrix[dice1_x_y[1]][dice1_x_y[0]] = 1
	#matrix[dice2_x_y[1]][dice2_x_y[0]] = 2
	#matrix[dice3_x_y[1]][dice3_x_y[0]] = 3
	#matrix[dice4_x_y[1]][dice4_x_y[0]] = 4
	#matrix[dice5_x_y[1]][dice5_x_y[0]] = 5
	#matrix[dice6_x_y[1]][dice6_x_y[0]] = 6
	
	setup_grid()

func check(var matrix_field):
	var next = get_node("Player").i 
	if next == 7:
		next = 1
	if matrix_field == next || matrix_field == 0:
		return true
	else:
		return false

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_up"):
		if player[0] != 0:
			#matrix_fields[player[1]][player[0]].visible = true
			matrix[player[1]][player[0]] = -1
			if matrix[player[1]][player[0]-1] != -1:
				player[0] = player[0]-1
				matrix_fields[player[1]][player[0]].visible = false
				get_node("Player").position.y = get_node("Player").position.y - 80
				get_node("Player").up_dots()
		else:
			matrix[player[1]][player[0]] = -1
			if matrix[player[1]][6] != -1:
				player[0] = 6
				matrix_fields[player[1]][player[0]].visible = false
				get_node("Player").position.y = get_node("Player").position.y + 480
				get_node("Player").up_dots()
		turn_dice()
	elif Input.is_action_just_pressed("ui_down"):
		if player[0] != 6:
			get_node("Player").can_up = true
			matrix[player[1]][player[0]] = -1
			if matrix[player[1]][player[0]+1] != -1:
				player[0] = player[0]+1
				matrix_fields[player[1]][player[0]].visible = false
				get_node("Player").position.y = get_node("Player").position.y + 80
				get_node("Player").up_dots()
		else:
			matrix[player[1]][player[0]] = -1
			if matrix[player[1]][0] != -1:
				player[0] = 0
				matrix_fields[player[1]][player[0]].visible = false
				get_node("Player").position.y = get_node("Player").position.y - 480
				get_node("Player").up_dots()
		turn_dice()
	elif Input.is_action_just_pressed("ui_right"):
		if player[1] != 8:
			matrix[player[1]][player[0]] = -1
			if matrix[player[1]+1][player[0]] != -1:
				player[1] = player[1]+1
				matrix_fields[player[1]][player[0]].visible = false
				get_node("Player").position.x = get_node("Player").position.x + 80
				get_node("Player").up_dots()
		else:
			matrix[player[1]][player[0]] = -1
			if matrix[0][player[0]] != -1:
				player[1] = 0
				matrix_fields[player[1]][player[0]].visible = false
				get_node("Player").position.x = get_node("Player").position.x - 640
				get_node("Player").up_dots()
		turn_dice()
	elif Input.is_action_just_pressed("ui_left"):
		if player[1] != 0:
			matrix[player[1]][player[0]] = -1
			if matrix[player[1]-1][player[0]] != -1:
				player[1] = player[1]-1
				matrix_fields[player[1]][player[0]].visible = false
				get_node("Player").position.x = get_node("Player").position.x - 80
				get_node("Player").up_dots()
		else:
			matrix[player[1]][player[0]] = -1
			if matrix[8][player[0]] != -1:
				player[1] = 8
				matrix_fields[player[1]][player[0]].visible = false
				get_node("Player").position.x = get_node("Player").position.x + 640
				matrix[player[1]][player[0]] = -1
				get_node("Player").up_dots()
		turn_dice()
