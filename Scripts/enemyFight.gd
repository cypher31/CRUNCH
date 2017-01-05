extends KinematicBody2D

var health
var playerStartPosition

func _ready():
	health = 3
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if(health == 0):
		get_node("/root/global").playerRestart = true
		get_node("/root/global").setScene("res://Scenes/Dungeon.tscn")
		self.queue_free()
	
	pass

func _on_playerCheck_body_enter( body ):
	if(body.is_in_group("playerFight")):
		health -= 1
	pass





