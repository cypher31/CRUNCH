extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("/root/global").playerCurrentHealth = 100
	pass


func _on_play_pressed():
	get_tree().change_scene("res://Scenes/instructionMenu.tscn")
	get_node("/root/global").playerCurrentHealth = 100
	pass # replace with function body


func _on_items_pressed():
	get_tree().change_scene("res://Scenes/itemMenu.tscn")
	pass # replace with function body


func _on_quit_pressed():
	get_tree().quit()
	pass # replace with function body
