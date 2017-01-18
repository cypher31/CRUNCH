extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var chooseItemClass = randi() % 3
	var randNumber = null
	
	if(chooseItemClass == 0):
		randNumber = randi() % get_node("/root/global").HELMS.size()
		get_node("Sprite").set_texture(get_node("/root/global").HELMS[randNumber])
	elif(chooseItemClass == 1):
		randNumber = randi() % get_node("/root/global").WEAPONS.size()
		get_node("Sprite").set_texture(get_node("/root/global").WEAPONS[randNumber])
	elif(chooseItemClass == 2):
		randNumber = randi() % get_node("/root/global").SHIELDS.size()
		get_node("Sprite").set_texture(get_node("/root/global").SHIELDS[randNumber])

	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	pass
