extends KinematicBody2D
#general 

#player constants

#player variables
var position
var block = false
var t 
var isTweening = false
var distance = 500
var duration = .5
var scale = 4.0
var isScale = false


func _ready():
	randomize()
	get_node("/root/global").stopButtonPrompts = false
	position = self.get_pos()
	set_fixed_process(true)
	set_process_input(true)
	pass

func _fixed_process(delta):
	#check player health
	if(get_node("/root/global").playerCurrentHealth <= 0):
		playerDead()
	
	#inputs for player
	var left_punch = Input.is_action_pressed("left_punch")
	var right_punch = Input.is_action_pressed("right_punch")

	if(left_punch && right_punch):
		block = true
		pass
	else:
		block = false
		pass
		
	#change scene
	if(get_node("/root/global").playerRestart == true && get_node("/root/global").timer == false):
		get_tree().change_scene("res://Scenes/Dungeon.tscn")
		get_node("/root/global").timer = true
	
func _input(event):
	#check current button prompt and attack if the player input matches that prompt
	if(event.is_action_pressed("left_punch") && isTweening == false && get_node("/root/global").currentButtonPrompt == "left"):
		#animate player
		t = Tween.new()
		add_child(t)

		t.interpolate_property(self, "transform/pos", Vector2(0,0), Vector2(distance,0), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "reset_player")
		t.start()
		isTweening = true
		
		#increase player combo
		get_node("/root/global").playerCurrentCombo += 1
	
	if(event.is_action_pressed("right_punch") && isTweening == false && get_node("/root/global").currentButtonPrompt == "right"):
		#animate player
		t = Tween.new()
		add_child(t)

		t.interpolate_property(self, "transform/pos", Vector2(0,0), Vector2(distance,0), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "reset_player")
		t.start()
		isTweening = true
		
		#increase player combo
		get_node("/root/global").playerCurrentCombo += 1
		
	if(block == true && isTweening == false && get_node("/root/global").currentButtonPrompt == "block"):
		#animate player
		t = Tween.new()
		add_child(t)
	
		isScale = true
		t.interpolate_property(self, "transform/scale", Vector2(1,1), Vector2(scale,scale), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "reset_player")
		t.start()
		isTweening = true
		
		#increase player combo
		get_node("/root/global").playerCurrentCombo += 1
		
	#damage player if the button they press is wrong
	if(event.is_action_pressed("left_punch") && isTweening == false):
		if(get_node("/root/global").currentButtonPrompt == "right" || block == true):
			damagePlayer()
		
	if(event.is_action_pressed("right_punch") && isTweening == false):
		if(get_node("/root/global").currentButtonPrompt == "left" || block == true):
			damagePlayer()
			
	if(block == true && isTweening == false):
		if(get_node("/root/global").currentButtonPrompt == "right" || get_node("/root/global").currentButtonPrompt == "left"):
			t = Tween.new()
		add_child(t)
	
		isScale = true
		t.interpolate_property(self, "transform/scale", Vector2(1,1), Vector2(scale,scale), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "reset_player")
		t.start()
		isTweening = true

func reset_player():
	if(isScale):
		self.scale(Vector2(1/scale,1/scale))
		isScale = false
		
	self.set_pos(position)
	t.queue_free()
	isTweening = false
	
	
func damagePlayer():
	get_node("invincibleTimer").start()
	get_node("/root/global").playerCurrentHealth -= 25
	get_node("/root/global").playerCurrentCombo = 0
	get_tree().reload_current_scene()

func playerDead():
	print("player dead :(")
	get_tree().reload_current_scene()
