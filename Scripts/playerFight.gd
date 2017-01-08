extends KinematicBody2D
#general 

#player constants

#player variables
var position
var t 
var isTweening = false
var distance = 500
var duration = .5


func _ready():
	position = self.get_pos()
	set_fixed_process(true)
	set_process_input(true)
	pass

func _fixed_process(delta):
	
	#inputs for player
	var left_punch = Input.is_action_pressed("left_punch")
	var right_punch = Input.is_action_pressed("right_punch")

	if(left_punch && right_punch):
		pass
	else:
		pass
		
		#change scene
	if(get_node("/root/global").playerRestart == true && get_node("/root/global").timer == false):
		get_tree().change_scene("res://Scenes/Dungeon.tscn")
		get_node("/root/global").timer = true
	
func _input(event):
	if(event.is_action_pressed("left_punch") && isTweening == false):

		t = Tween.new()
		add_child(t)

		t.interpolate_property(self, "transform/pos", Vector2(0,0), Vector2(distance,0), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "reset_player")
		t.start()
		isTweening = true
	
	if(event.is_action_pressed("right_punch") && isTweening == false):
		t = Tween.new()
		add_child(t)

		t.interpolate_property(self, "transform/pos", Vector2(0,0), Vector2(distance,0), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "reset_player")
		t.start()
		isTweening = true
	

func reset_player():
	self.set_pos(position)
	t.queue_free()
	isTweening = false
