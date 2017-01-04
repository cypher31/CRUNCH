extends KinematicBody2D
#general 

#player constants

#player variables


func _fixed_process(delta):
	
	#inputs for player
	var left_punch = Input.is_action_pressed("left_punch")
	var right_punch = Input.is_action_pressed("right_punch")

	if(left_punch && right_punch):
		#reset to first scene
		get_node("/root/global").setScene("res://Scenes/Dungeon.tscn")
	else:
		pass
	
	if(is_colliding()):
		pass

func _input(event):
	#JUMP LOGIC~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if(event.is_action_pressed("left_punch")):
		pass

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	pass
