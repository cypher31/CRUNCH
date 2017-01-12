extends KinematicBody2D

var time

var health
var playerStartPosition
var enemyKilled = false
var coinSpawn = true
var coinCount = 0

onready var coin = preload("res://Scenes/CoinFight.tscn")

func _ready():
	time = 0
	health = 3
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	time -= delta
	get_node("/root/global").coinsToMultiply = coinCount
	
	pass

func _on_playerCheck_body_enter( body ):
	if(body.is_in_group("playerFight") && health > 0):
		health -= 1
	
	if(health <= 0 && coinSpawn == true):
		get_node("/root/global").playerRestart = true
		get_parent().get_node("Timers/Timer").start()
		
		coinSpawn()
		
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
		get_parent().get_node("itemHolder").add_child(gold_coin)
		coinCount = get_parent().get_node("itemHolder").get_child_count()
		get_node("/root/global").playerScore += coinCount * get_node("/root/global").coin_gold_points 
	
	coinSpawn = false
	
	
