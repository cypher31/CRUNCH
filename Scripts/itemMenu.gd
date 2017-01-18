extends CanvasLayer

func _ready():
	for i in range(get_node("/root/global").unlockedHELMS.size()):
		get_node("helmScroll/helm").add_button(" ", " ")
		get_node("helmScroll/helm").set_button_icon(i, get_node("/root/global").unlockedHELMS[i])
		
	for i in range(get_node("/root/global").unlockedWEAPONS.size()):
		get_node("weaponScroll/weapon").add_button(" ", " ")
		get_node("weaponScroll/weapon").set_button_icon(i, get_node("/root/global").unlockedWEAPONS[i])
		
	for i in range(get_node("/root/global").unlockedSHIELDS.size()):
		get_node("shieldScroll/shield").add_button(" ", " ")
		get_node("shieldScroll/shield").set_button_icon(i, get_node("/root/global").unlockedSHIELDS[i])
	
		
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

	pass

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/mainMenu.tscn")
	pass # replace with function body
