extends Node2D

var matrix = []
var matrix_fields = []
var width = 9
var height = 7

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

func _ready():
	for x in range(width):
		matrix.append([])
		matrix_fields.append([])
# warning-ignore:unused_variable
		for y in range(height):
			matrix[x].append(0)
			matrix_fields[x].append(0)
	
	matrix[dice1_x_y[1]][dice1_x_y[0]] = 1
	matrix[dice2_x_y[1]][dice2_x_y[0]] = 2
	matrix[dice3_x_y[1]][dice3_x_y[0]] = 3
	matrix[dice4_x_y[1]][dice4_x_y[0]] = 4
	matrix[dice5_x_y[1]][dice5_x_y[0]] = 5
	matrix[dice6_x_y[1]][dice6_x_y[0]] = 6
	
	setup_grid()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_up"):
		if player[0] != 0:
			get_node("Player").can_down = true
			matrix_fields[player[1]][player[0]].visible = true
			player[0] = player[0]-1
			matrix_fields[player[1]][player[0]].visible = false
			get_node("Player").position.y = get_node("Player").position.y - 80
		else:
			get_node("Player").can_up = false
	elif Input.is_action_just_pressed("ui_down"):
		if player[0] != 6:
			get_node("Player").can_up = true
			matrix_fields[player[1]][player[0]].visible = true
			player[0] = player[0]+1
			matrix_fields[player[1]][player[0]].visible = false
			get_node("Player").position.y = get_node("Player").position.y + 80
		else:
			get_node("Player").can_down = false
	elif Input.is_action_just_pressed("ui_right"):
		if player[1] != 8:
			matrix_fields[player[1]][player[0]].visible = true
			player[1] = player[1]+1
			matrix_fields[player[1]][player[0]].visible = false
			get_node("Player").position.x = get_node("Player").position.x + 80
	elif Input.is_action_just_pressed("ui_left"):
		if player[1] != 0:
			matrix_fields[player[1]][player[0]].visible = true
			player[1] = player[1]-1
			matrix_fields[player[1]][player[0]].visible = false
			get_node("Player").position.x = get_node("Player").position.x - 80
		
