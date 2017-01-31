extends KinematicBody2D
#general 

#player constants
const GRAVITY = 2000 #downward force
const MAX_WALK_SPEED = 500 #maximum walk speed
const WALK_ACC = 2000 #walk acceleration
const JUMP_FORCE = 750 #player jump force
const SLIDE_STOP_VELOCITY = 1.0
const SLIDE_STOP_MIN_TRAVEL = 1.0
const FLOOR_ANGLE_TOLERANCE = 40
const JUMP_MAX_AIRBORNE_TIME = 1

#player variables
var time
var playerStartPosition
var velocity = Vector2()
var jumpTime = false
var on_air_time = 100
var force
var motion
var jump = false
var prev_jump_pressed = false
var jumping = false
var grounded = true

func _ready():
	time = 1
	if(get_node("/root/global").playerRestart == true):
		self.set_global_pos(get_node("/root/global").playerStartPosition + Vector2(74,-32))
		get_node("/root/global").playerRestart = false
		
		#multiply the players current score by the combo to calculate the final score
		get_node("/root/global").playerScore += (get_node("/root/global").playerCurrentCombo * get_node("/root/global").coin_gold_points * get_node("/root/global").coinsToMultiply)
	
	#Make sure enemy has health 
	get_node("/root/global").enemyHealth = 100
	
	set_fixed_process(true)
		
	set_process_input(true)
	pass

func _fixed_process(delta):
	###DEBUG ONLY### To exit to main menu press ESC
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().change_scene("res://Scenes/mainMenu.tscn")
			
	time -= delta
	force = Vector2(0, 0)
	
	#inputs for player
	var left_punch = Input.is_action_pressed("left_punch")
	var right_punch = Input.is_action_pressed("right_punch")

	if(left_punch && right_punch):
		jump = true
	else:
		jump = false
	
	if(velocity.x < MAX_WALK_SPEED && jump == false):
		force.x += WALK_ACC
#
#	#set the players downward speed
	force.y = GRAVITY
	
	#integrate forces to velocity
	velocity += force * delta
	
	#integrate velocity into motion and move
	motion = velocity * delta
	
	#move the player
	if(time <= 0):
		move(motion)
	
	var floor_velocity = Vector2()
	
	if(is_colliding()):
		var n = get_collision_normal()
		
		#Jump logic collision norm
		if(n == Vector2(0,-1)):
			grounded = true
		else:
			grounded = false
		
		if(rad2deg(acos(n.dot(Vector2(0, -1)))) < FLOOR_ANGLE_TOLERANCE):
			#if angle to the up vectors is < agnle tolerance
			#char is on the floor
			on_air_time = 0
			floor_velocity = get_collider_velocity()
			
			
		if(on_air_time == 0 and force.x == 0 and get_travel().length() < SLIDE_STOP_MIN_TRAVEL and abs(velocity.x) < SLIDE_STOP_VELOCITY and get_collider_velocity() == Vector2()):
			revert_motion()
			velocity.y = 0.0
		
		else:
			#for every other case of motion, our motion was interrupted
			#try to complete the motion by sliding by the normal
			motion = n.slide(motion)
			velocity = n.slide(velocity)
			#then move
			move(motion)

	if(jump and grounded):
		# jump must also be allowed to happen if the character left the floor a little bit ago
		#makes control more snappy
		velocity.y = -JUMP_FORCE
		jump = false
	pass

func _on_groundCheck_body_enter( body ):
	grounded = true
	pass # replace with function body


func _on_groundCheck_body_exit( body ):
	grounded = false
	pass # replace with function body
