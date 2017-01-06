extends KinematicBody2D

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if(get_node("/root/global").currentRunEnemy == true):
		self.queue_free()
	pass

func _on_playerCheck_body_enter( body ):
	if(body.is_in_group("playerRun")):
		get_node("/root/global").playerStartPosition = self.get_global_pos()
		get_node("/root/global").currentRunEnemy = true
		get_node("/root/global").setScene("res://Scenes/Dungeon_Fight.tscn")
	pass





