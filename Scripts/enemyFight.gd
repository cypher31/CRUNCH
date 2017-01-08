extends KinematicBody2D

var health
var playerStartPosition
var enemyKilled = false

onready var coin = preload("res://Scenes/CoinFight.tscn")

func _ready():
	health = 3
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	pass

func _on_playerCheck_body_enter( body ):
	if(body.is_in_group("playerFight")):
		health -= 1
	
	if(health == 0):
		get_node("/root/global").playerRestart = true
			
		for i in range(rand_range(1,50)):
			var gold_coin = coin.instance()
			get_parent().get_node("itemHolder").add_child(gold_coin)
		
		#get number of coins generated - used to calculate how much to add to player score	
		var coinCount = get_parent().get_node("itemHolder").get_child_count()
		get_node("/root/global").playerScore += coinCount * get_node("/root/global").coin_gold_points 
		
		get_node("Sprite").hide()
		get_node("SpriteDead").set_opacity(1)
		health += 1
	pass
	
func _on_Timer_timeout():
	get_node("/root/global").timer = false
	pass # replace with function body
