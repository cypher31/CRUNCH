extends Control

var time

var new_button
var buttonCheck
var spawnBullet = true
var t 
var isTweening = false
var distance = 768
var duration = 1.25

var leftButton = preload("res://Scenes/leftButton.tscn")
var rightButton = preload("res://Scenes/rightButton.tscn")
var blockButton = preload("res://Scenes/blockButton.tscn")

func _ready():
	time = 1
	set_fixed_process(true)
	get_node("/root/global").stopButtonPrompts = false

	get_node("/root/global").levelText = "Dungeon_Fight"
	pass

func _fixed_process(delta):
	time -= delta
	
	#update player score and combo
	get_node("playerScore").set_text("Gold: " + str(get_node("/root/global").playerScore))
	get_node("playerCombo").set_text(str(get_node("/root/global").playerCurrentCombo))
	
	#update player health
	get_node("playerHealth").set_value(get_node("/root/global").playerCurrentHealth)
	
	#update enemy health
	get_node("enemyHealth").set_value(get_node("/root/global").enemyHealth)
	
	if(spawnBullet && time <= 0 && get_node("/root/global").stopButtonPrompts == false):
		spawnBullet = false
		get_node("buttonTimer").set_wait_time(duration)
		get_node("buttonTimer").start()
		buttonCheck = rand_range(0, 15)
		
		#instance left button prompt
		if(buttonCheck <= 5):
			new_button = leftButton.instance()
			get_node("/root/global").currentButtonPrompt = "left"
			get_node("promptSpawn").add_child(new_button)
			new_button.set_size(Vector2(64,64))
			
		#instance right button prompt
		if(buttonCheck > 5 && buttonCheck <= 10):
			new_button = rightButton.instance()
			get_node("/root/global").currentButtonPrompt = "right"
			get_node("promptSpawn").add_child(new_button)
			new_button.set_size(Vector2(64,64))
		
		#instance block button prompt
		if(buttonCheck > 10 && buttonCheck <= 15):
			new_button = blockButton.instance()
			get_node("/root/global").currentButtonPrompt = "block"
			get_node("promptSpawn").add_child(new_button)
			new_button.set_size(Vector2(64,64))
			duration *= .75
			
			get_node("/root/global").playerPressedButton = true
		
		t = Tween.new()
		add_child(t)
		
		t.interpolate_property(new_button, "rect/pos", Vector2(0,0), Vector2(-distance,0), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "end_label")
		t.start()
		isTweening = true
		
func end_label():
	new_button.queue_free()
	t.queue_free()
	isTweening = false
	get_node("/root/global").currentButtonPrompt = "none"
	duration = 1.25
	
	if(get_node("/root/global").playerPressedButton == true):
		get_node("/root/global").playerPressedButton = false
	elif(get_node("/root/global").playerPressedButton == false && get_node("/root/global").enemyHealth > 0):
		get_node("/root/global").playerCurrentHealth -= 10
		get_node("/root/global").playerCurrentCombo = 0

func _on_buttonTimer_timeout():
	spawnBullet = true
	pass # replace with function body

