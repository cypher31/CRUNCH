extends KinematicBody2D

var time

var playerStartPosition
var enemyKilled = false
var coinSpawn = true
var coinCount = 0

#Enemy variables
var position

#tween variables
var t
var distance = -500 #Should be same distance as player
var duration = .5

onready var coin = preload("res://Scenes/CoinFight.tscn")
onready var loot = preload("res://Scenes/lootSpawn.tscn")

func _ready():
	time = 0
	position = self.get_pos()
	get_node("/root/global").enemyArmor = 1
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	time -= delta
	get_node("/root/global").coinsToMultiply = coinCount
	
	if(get_node("/root/global").currentButtonPrompt == "block"):
		get_parent().get_node("Timers/attackTimer").set_wait_time(.5) #should turn this into a global later
		get_parent().get_node("Timers/attackTimer").start()
		get_node("/root/global").stopButtonPrompts = true
		
	pass

func _on_playerCheck_body_enter( body ):
	if(body.is_in_group("playerFight") && get_node("/root/global").enemyHealth > 0 && !get_node("/root/global").enemyAttack == true):
		get_node("/root/global").enemyHealth -=  get_node("/root/global").playerAttackDmg / get_node("/root/global").enemyArmor
	
	if(body.is_in_group("playerFight") && get_node("/root/global").enemyAttack == true && get_node("/root/global").playerBlocking == false):
		print("true")
		get_node("/root/global").playerCurrentHealth -= 25 #change to enemy attack variable
		get_node("/root/global").playerCurrentCombo = 0
	
	if(body.is_in_group("playerFight") && get_node("/root/global").enemyHealth > 0 && get_node("/root/global").playerBlocking == true):
		get_node("/root/global").enemyHealth -=  (get_node("/root/global").playerAttackDmg * .25) / get_node("/root/global").enemyArmor
	
	if(get_node("/root/global").enemyHealth <= 0 && coinSpawn == true):
		get_node("/root/global").playerRestart = true
		get_parent().get_node("Timers/Timer").start()
		
		coinSpawn()
		
		lootSpawn()
		
		get_node("Sprite").hide()
		get_node("SpriteDead").set_opacity(1)
		
		get_node("/root/global").stopButtonPrompts = true
		
	pass
	
func _on_Timer_timeout():
	get_node("/root/global").timer = false
	pass # replace with function body
	
func coinSpawn():
	for i in range(rand_range(1,100)):
		var gold_coin = coin.instance()
		get_parent().get_node("KinematicBody2D/itemHolder").add_child(gold_coin)
		coinCount = get_parent().get_node("KinematicBody2D/itemHolder").get_child_count()

	get_node("/root/global").playerScore += coinCount * get_node("/root/global").coin_gold_points
	coinSpawn = false
	

func lootSpawn():
	var lootSpawn = loot.instance()
	get_parent().get_node("KinematicBody2D/itemHolder").add_child(lootSpawn)
	
#enemy attack function on timeout
func _on_attackTimer_timeout():
	if(get_node("/root/global").enemyHealth > 0):
		get_node("/root/global").enemyAttack = true
		#animate enemy
		t = Tween.new()
		add_child(t)
	
		t.interpolate_property(self, "transform/pos", Vector2(0,0), Vector2(distance,0), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "reset_enemy")
		t.start()
		pass # replace with function body

func reset_enemy():
	self.set_pos(position)
	get_node("/root/global").stopButtonPrompts = false #restart button prompts
	get_node("/root/global").playerBlocking = false
	get_node("/root/global").enemyAttack = false
	t.queue_free()
