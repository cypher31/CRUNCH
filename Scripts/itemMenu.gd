extends CanvasLayer

func _ready():
	for i in range(get_node("/root/global").HELMS.size()):
		get_node("helmScroll/helm").add_button("",str(get_node("/root/global").HELMS[i][2]))
		
	for i in range(get_node("/root/global").WEAPONS.size()):
		get_node("weaponScroll/weapon").add_button("",str(get_node("/root/global").WEAPONS[i][2]))
		
	for i in range(get_node("/root/global").SHIELDS.size()):
		get_node("shieldScroll/shield").add_button("",str(get_node("/root/global").SHIELDS[i][2]))
	
	for i in range(get_node("/root/global").HELMS.size()):
		if(get_node("/root/global").unlockedHELMS.has(i)):
			get_node("helmScroll/helm").set_button_icon(i, get_node("/root/global").unlockedHELMS[i][0])
		
	for i in range(get_node("/root/global").WEAPONS.size()):
		if(get_node("/root/global").unlockedWEAPONS.has(i)):
			get_node("weaponScroll/weapon").set_button_icon(i, get_node("/root/global").unlockedWEAPONS[i][0])
		
	for i in range(get_node("/root/global").SHIELDS.size()):
		if(get_node("/root/global").unlockedSHIELDS.has(i)):
			get_node("shieldScroll/shield").set_button_icon(i, get_node("/root/global").unlockedSHIELDS[i][0])
	
		
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	#Set player equipment during gameplay
	get_node("/root/global").selectedHelm = get_node("helmScroll/helm").get_selected()
	get_node("/root/global").HEAD = get_node("/root/global").HELMS[get_node("/root/global").selectedHelm]
	
	get_node("/root/global").selectedWeapon = get_node("weaponScroll/weapon").get_selected()
	get_node("/root/global").WEAPON = get_node("/root/global").WEAPONS[get_node("/root/global").selectedWeapon]
	
	get_node("/root/global").selectedShield = get_node("shieldScroll/shield").get_selected()
	get_node("/root/global").SHIELD = get_node("/root/global").SHIELDS[get_node("/root/global").selectedShield]
	
	get_node("/root/global").playerLevel = get_node("/root/global").HEAD[1] + get_node("/root/global").WEAPON[1] + get_node("/root/global").SHIELD[1]

	pass

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/mainMenu.tscn")
	print(get_node("/root/global").playerLevel)
	pass # replace with function body
