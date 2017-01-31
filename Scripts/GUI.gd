extends Control

func _fixed_process(delta):
#	get_node("stageName").set_text(get_node("/root/global").levelText)
	get_node("stageName").set_text("Player Level: " + str(get_node("/root/global").playerLevel))
	get_node("playerScore").set_text("Gold: " + str(get_node("/root/global").playerScore))
	pass

func _ready():
	set_fixed_process(true)
	pass


func _on_Back_pressed():
	get_tree().change_scene("res://Scenes/mainMenu.tscn")
	pass # replace with function body
