extends KinematicBody2D


const GRAVITY = 100.0
const WALK_SPEED = 200
const JUMP_SPEED = 150
const MAX_JUMPS = 2
var JUMPS_AVALIABLE = MAX_JUMPS

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("jump") and JUMPS_AVALIABLE > 0:
		velocity.y = -JUMP_SPEED
		JUMPS_AVALIABLE -= 1
	
	move_and_slide(velocity, Vector2(0, -1))\
	
	if is_on_floor():
		JUMPS_AVALIABLE = MAX_JUMPS
