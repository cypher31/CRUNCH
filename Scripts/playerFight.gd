extends KinematicBody2D
#general 

#player constants

#player variables
var position
var t 
var block = false
var isTweening = false
var distance = 500
var duration = .5 #change enemyAttack timer if you change this - they should match
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
		
	if(get_node("/root/global").playerBlocking == true):
		self.set_scale(Vector2(-1,1))
	
	if(get_node("/root/global").playerBlocking == false):
		self.set_scale(Vector2(1,1))
		
	#change scene
	if(get_node("/root/global").playerRestart == true && get_node("/root/global").timer == false):
		get_tree().change_scene("res://Scenes/Dungeon.tscn")
		get_node("/root/global").timer = true
		
	#Player block logic
	if(block == true && get_node("/root/global").playerBlocking == false && isTweening == false && get_node("/root/global").currentButtonPrompt == "block"):
		#set blocking true
		get_node("/root/global").playerCurrentCombo += 1
		get_node("/root/global").playerPressedButton = true
		
		get_node("/root/global").playerBlocking = true
		playerBlock()
		block = false
	
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
		
		get_node("/root/global").playerPressedButton = true
		
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
		
		get_node("/root/global").playerPressedButton = true
		
		#increase player combo
		get_node("/root/global").playerCurrentCombo += 1
		
	#damage player if the button they press is wrong
	if(event.is_action_pressed("left_punch") && isTweening == false && !get_node("/root/global").currentButtonPrompt == "block"):
		#damage player if they press both buttons at once
		if(block == true):
			damagePlayer()
		
		if(get_node("/root/global").currentButtonPrompt == "right"):
			damagePlayer()
			get_node("/root/global").currentButtonPrompt = "none"
			pass
		
	if(event.is_action_pressed("right_punch") && isTweening == false && !get_node("/root/global").currentButtonPrompt == "block"):
		#damage player if they press both buttons at once
		if(block == true):
			damagePlayer()
		
		if(get_node("/root/global").currentButtonPrompt == "left"):
			damagePlayer()
			get_node("/root/global").currentButtonPrompt = "none"
			pass
			
	if(get_node("/root/global").playerBlocking == true):
		if(get_node("/root/global").currentButtonPrompt == "right" || get_node("/root/global").currentButtonPrompt == "left"):
			get_node("/root/global").currentButtonPrompt = "none"
			pass

#Reset player position after done attacking
func reset_player():
	self.set_pos(position)
	t.queue_free()
	isTweening = false
	
#Player takes damage when they press the wrong button prompt
func damagePlayer():
	get_node("invincibleTimer").start()
	get_node("/root/global").playerCurrentHealth -= 25
	get_node("/root/global").playerCurrentCombo = 0
	get_tree().reload_current_scene()

#Logic once player is dead
func playerDead():
	get_tree().change_scene("res://Scenes/mainMenu.tscn")
	
func playerBlock():
	pass
