extends KinematicBody2D
#general 
var time
var timeDelta

#player constants
const GRAVITY = 4.4
const MAX_WALK_SPEED = 300
const WALK_ACC = 300
const JUMP_FORCE = 50

#player variables
var velocity = Vector2()
var motion
var jump = false

func _fixed_process(delta):
	
	var left_punch = Input.is_action_pressed("left_punch")
	var right_punch = Input.is_action_pressed("right_punch")
	#WALK LOGIC~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	#increase the players velocity as long as it is below the max walking speed
	if(velocity.x < MAX_WALK_SPEED):
		velocity.x += WALK_ACC * delta
	else:
		velocity.x = MAX_WALK_SPEED
	
	#set the players downward speed
	velocity.y = GRAVITY
	
	#holder for player velocity
	motion = velocity
	
	#move the player
	move(motion)
	#player touching ground logic
	if(is_colliding()):
		jump = false
	
	pass

func _input(event):
	#JUMP LOGIC~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		pass
	
func _ready():
	set_fixed_process(true)
	set_process_input(true)
	pass
