extends KinematicBody2D


func _ready():
	
	pass


func _on_playerCheck_body_enter( body ):
	if(body.is_in_group("player")):
		get_node("/root/global").setScene("res://Scenes/Dungeon_Fight.tscn")
	pass # replace with function body
