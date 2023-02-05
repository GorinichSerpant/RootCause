extends KinematicBody2D


const GRAVITY = 50.0
const WALK_SPEED = 100
const JUMP_SPEED = 60
const MAX_JUMPS = 1
var JUMPS_AVALIABLE = MAX_JUMPS

var velocity = Vector2()

onready var _animated_sprite = $AnimatedSprite

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("jump"):
		_animated_sprite.play("fly")
		
	elif Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
		_animated_sprite.flip_h = true
		_animated_sprite.play("walk")
		
	elif Input.is_action_pressed("move_right"):
		velocity.x =  WALK_SPEED
		_animated_sprite.flip_h = false
		_animated_sprite.play("walk")
		
	
		
	else:
		velocity.x = 0
		_animated_sprite.play("idle")
	
	if Input.is_action_just_pressed("jump") and JUMPS_AVALIABLE > 0:
		velocity.y = -JUMP_SPEED
		JUMPS_AVALIABLE -= 1
		
	
	
		
	move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor():
		JUMPS_AVALIABLE = MAX_JUMPS
