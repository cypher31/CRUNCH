extends Node

func _ready():
	#set helm armor if no selection is made
	if(get_node("/root/global").selectedHelm == null):
		get_node("/root/global").HEAD = get_node("/root/global").red_helm
		#set helm texture
	get_node("Head").set_texture(get_node("/root/global").HEAD)
		#set helm position
	get_node("Head").translate(Vector2(0,-50))
	
	#set weapon if no selection is made
	if(get_node("/root/global").selectedWeapon == null):
		get_node("/root/global").WEAPON = get_node("/root/global").bronze_sword
		#set weapon texture
	get_node("Weapon").set_texture(get_node("/root/global").WEAPON)
		#set weapon position
	get_node("Weapon").translate(Vector2(50,0))
		#TEMP flip texture
	get_node("Weapon").set_flip_h(true)
	
	#set shield if no selection is made
	if(get_node("/root/global").selectedShield == null):
		get_node("/root/global").SHIELD = get_node("/root/global").brown_shield
		#set shield texture
	get_node("Shield").set_texture(get_node("/root/global").SHIELD)
		#set shield position
	get_node("Shield").translate(Vector2(-30,0))
	
	pass

func _fixed_process(delta):
	pass
