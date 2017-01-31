extends Node

func _ready():
	#set helm armor if no selection is made
	if(get_node("/root/global").selectedHelm == null):
		get_node("/root/global").HEAD = get_node("/root/global").HELMS[0]
	
		#set helm texture
	get_node("Head").set_texture(get_node("/root/global").HEAD[0])
		#set helm position
	get_node("Head").translate(Vector2(0,-50))
	
	#set weapon if no selection is made
	if(get_node("/root/global").selectedWeapon == null):
		get_node("/root/global").WEAPON = get_node("/root/global").WEAPONS[0]

		#set weapon texture
	get_node("Weapon").set_texture(get_node("/root/global").WEAPON[0])
		#set weapon position
	get_node("Weapon").translate(Vector2(50,0))
		#TEMP flip texture
	get_node("Weapon").set_flip_h(true)
	
	#set shield if no selection is made
	if(get_node("/root/global").selectedShield == null):
		get_node("/root/global").SHIELD = get_node("/root/global").SHIELDS[0]

		#set shield texture
	get_node("Shield").set_texture(get_node("/root/global").SHIELD[0])
		#set shield position
	get_node("Shield").translate(Vector2(-30,0))
	
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	#update player level
	get_node("/root/global").playerLevel = get_node("/root/global").HEAD[1] + get_node("/root/global").WEAPON[1] + get_node("/root/global").SHIELD[1]
	
	if(get_tree().get_current_scene().get_name() == "itemMenu"):
			#set helm armor if no selection is made
		if(get_node("/root/global").selectedHelm == null):
			get_node("/root/global").HEAD = get_node("/root/global").HELMS[0]
		
			#set helm texture
		get_node("Head").set_texture(get_node("/root/global").HEAD[0])
			#set helm position
		get_node("Head").set_pos(Vector2(0,-50))
		
		#set weapon if no selection is made
		if(get_node("/root/global").selectedWeapon == null):
			get_node("/root/global").WEAPON = get_node("/root/global").WEAPONS[0]
	
			#set weapon texture
		get_node("Weapon").set_texture(get_node("/root/global").WEAPON[0])
			#set weapon position
		get_node("Weapon").set_pos(Vector2(50,0))
			#TEMP flip texture
		get_node("Weapon").set_flip_h(true)
		
		#set shield if no selection is made
		if(get_node("/root/global").selectedShield == null):
			get_node("/root/global").SHIELD = get_node("/root/global").SHIELDS[0]
	
			#set shield texture
		get_node("Shield").set_texture(get_node("/root/global").SHIELD[0])
			#set shield position
		get_node("Shield").set_pos(Vector2(-30,0))
	
	pass
