extends KinematicBody2D

var grounded

func _fixed_process(delta):
	if(is_colliding()):
		grounded = true

	pass

func _ready():
	set_fixed_process(true)
	pass
