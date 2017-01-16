extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("/root/global").equipmentArray = [get_node("/root/global").red_helm, get_node("/root/global").silver_sword, get_node("/root/global").brown_shield]
	
	var randNumber = randi() % get_node("/root/global").equipmentArray.size()
	
	get_node("Sprite").set_texture(get_node("/root/global").equipmentArray[randNumber])
	
	print(randNumber)
	
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	pass
