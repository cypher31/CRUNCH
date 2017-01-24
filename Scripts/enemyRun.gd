extends KinematicBody2D

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	pass

func _on_playerCheck_body_enter( body ):
	if(body.is_in_group("playerRun")):
		get_node("/root/global").playerStartPosition = self.get_global_pos()
		get_node("/root/global").currentRunEnemy = true
		
		if(get_node("/root/global").isTutorial):
			get_tree().change_scene("res://Scenes/tutorial/Dungeon_Fight_Tut.tscn")
			self.queue_free()
		else:
			get_tree().change_scene("res://Scenes/Dungeon_Fight.tscn")
			self.queue_free()
	
	pass





