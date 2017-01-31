extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var enemyEntranceScene = preload("res://Scenes/EnemyRun.tscn")

func _ready():
	get_node("/root/global").levelText = "Dungeon"
	
#	#spawn enemies
#	for i in range(randi() % 5+1 + 5):
#		var enemyEntrance = enemyEntranceScene.instance()
#		add_child(enemyEntrance)
#		
#		enemyEntrance.set_global_pos(Vector2(600 + randi() % 200*62,-38))
		
	pass


func _on_Area2D_body_enter( body ):
	get_tree().change_scene("res://Scenes/instructionMenu.tscn")
	pass # replace with function body
