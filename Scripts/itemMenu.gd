extends CanvasLayer

var canBuy = true

var newPopUp

var helms = false
var weapons = false
var shields = false

var buyItemPopUp = preload("res://Scenes/buyItemPopUp.tscn")

func _ready():
	for i in range(get_node("/root/global").HELMS.size()):
		get_node("helmScroll/helm").add_button(str(get_node("/root/global").HELMS[i][2]), "")
		
	for i in range(get_node("/root/global").WEAPONS.size()):
		get_node("weaponScroll/weapon").add_button(str(get_node("/root/global").WEAPONS[i][2]), "")
		
	for i in range(get_node("/root/global").SHIELDS.size()):
		get_node("shieldScroll/shield").add_button(str(get_node("/root/global").SHIELDS[i][2]), "")
	
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	#Set item icons
	for i in range(get_node("/root/global").HELMS.size()):
		if(get_node("/root/global").unlockedHELMS.has(i)):
			get_node("helmScroll/helm").set_button_icon(i, get_node("/root/global").unlockedHELMS[i][0])
			get_node("helmScroll/helm").set_button_text(i, "")
		
	for i in range(get_node("/root/global").WEAPONS.size()):
		if(get_node("/root/global").unlockedWEAPONS.has(i)):
			get_node("weaponScroll/weapon").set_button_icon(i, get_node("/root/global").unlockedWEAPONS[i][0])
			get_node("weaponScroll/weapon").set_button_text(i, "")
		
	for i in range(get_node("/root/global").SHIELDS.size()):
		if(get_node("/root/global").unlockedSHIELDS.has(i)):
			get_node("shieldScroll/shield").set_button_icon(i, get_node("/root/global").unlockedSHIELDS[i][0])
			get_node("shieldScroll/shield").set_button_text(i, "")
	
	
	#Set player equipment during gameplay
	get_node("/root/global").selectedHelm = get_node("helmScroll/helm").get_selected()
	get_node("/root/global").selectedWeapon = get_node("weaponScroll/weapon").get_selected()
	get_node("/root/global").selectedShield = get_node("shieldScroll/shield").get_selected()
	
	
	#Check if player has unlocked that item yet
	if(get_node("/root/global").unlockedHELMS.has(get_node("helmScroll/helm").get_selected())):
		get_node("/root/global").HEAD = get_node("/root/global").HELMS[get_node("/root/global").selectedHelm]

		#Check if player has unlocked that item yet
	if(get_node("/root/global").unlockedWEAPONS.has(get_node("weaponScroll/weapon").get_selected())):
		get_node("/root/global").WEAPON = get_node("/root/global").WEAPONS[get_node("/root/global").selectedWeapon]
	
		#Check if player has unlocked that item yet
	if(get_node("/root/global").unlockedSHIELDS.has(get_node("shieldScroll/shield").get_selected())):
		get_node("/root/global").SHIELD = get_node("/root/global").SHIELDS[get_node("/root/global").selectedShield]

			
	#Check player level
	get_node("/root/global").playerLevel = get_node("/root/global").HEAD[1] + get_node("/root/global").WEAPON[1] + get_node("/root/global").SHIELD[1]
		
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/mainMenu.tscn")
	print(get_node("/root/global").playerLevel)
	pass # replace with function body
	
	#Buy items if player accepts dialog
func buy_It_Accepted():
	if(helms == true):
		#Deduct gold from player
		get_node("/root/global").playerScore -= get_node("/root/global").HELMS[get_node("/root/global").selectedHelm][2]
		#Unlock helm for player
		get_node("/root/global").unlockedHELMS[get_node("/root/global").selectedHelm] = get_node("/root/global").HELMS[get_node("/root/global").selectedHelm]
		helms = false
		
	if(weapons == true):
		#Deduct gold from player
		get_node("/root/global").playerScore -= get_node("/root/global").WEAPONS[get_node("/root/global").selectedWeapon][2]
		#Unlock helm for player
		get_node("/root/global").unlockedWEAPONS[get_node("/root/global").selectedWeapon] = get_node("/root/global").WEAPONS[get_node("/root/global").selectedWeapon]
		weapons = false

	if(shields == true):
		#Deduct gold from player
		get_node("/root/global").playerScore -= get_node("/root/global").SHIELDS[get_node("/root/global").selectedShield][2]
		#Unlock helm for player
		get_node("/root/global").unlockedSHIELDS[get_node("/root/global").selectedShield] = get_node("/root/global").SHIELDS[get_node("/root/global").selectedShield]
		shields = false


func _on_helm_button_selected( button_idx ):
	#delete last pop up if new button is selected
	if(!newPopUp == null):
		newPopUp.hide()
		
	#Create a new pop up
	if(!get_node("/root/global").unlockedHELMS.has(button_idx)):
		if(str(get_node("/root/global").playerScore) >= get_node("helmScroll/helm").get_button_text(get_node("helmScroll/helm").get_selected())):
			get_node("/root/global").selectedHelm = button_idx
			newPopUp = buyItemPopUp.instance()
			self.add_child(newPopUp)
			newPopUp.show()
			#set pop up text
			newPopUp.set_text("Buy" + " " + get_node("/root/global").HELMS[get_node("/root/global").selectedHelm][3] + " for "+ str(get_node("/root/global").HELMS[get_node("/root/global").selectedHelm][2]) + " gold?" + 
			"\nLevel: " + str(get_node("/root/global").HELMS[get_node("/root/global").selectedHelm][1]))
			
			canBuy = false
			
			helms = true
			weapons = false
			shields = false
			
			newPopUp.connect("confirmed", self, "buy_It_Accepted")


func _on_weapon_button_selected( button_idx ):
	#delete last pop up if new button is selected
	if(!newPopUp == null):
		newPopUp.hide()
		
	#Create a new pop up
	if(!get_node("/root/global").unlockedWEAPONS.has(button_idx)):
		if(str(get_node("/root/global").playerScore) >= get_node("weaponScroll/weapon").get_button_text(get_node("weaponScroll/weapon").get_selected())):
			get_node("/root/global").selectedWeapon = button_idx
			newPopUp = buyItemPopUp.instance()
			self.add_child(newPopUp)
			newPopUp.show()
			#set pop up text
			newPopUp.set_text("Buy" + " " + get_node("/root/global").WEAPONS[get_node("/root/global").selectedWeapon][3] + " for "+ str(get_node("/root/global").WEAPONS[get_node("/root/global").selectedWeapon][2]) + " gold?" + 
			"\nLevel: " + str(get_node("/root/global").WEAPONS[get_node("/root/global").selectedWeapon][1]))
			
			canBuy = false
			
			helms = false
			weapons = true
			shields = false
			
			newPopUp.connect("confirmed", self, "buy_It_Accepted")


func _on_shield_button_selected( button_idx ):
	#delete last pop up if new button is selected
	if(!newPopUp == null):
		newPopUp.hide()
		
	#Create a new pop up
	if(!get_node("/root/global").unlockedSHIELDS.has(button_idx)):
		if(str(get_node("/root/global").playerScore) >= get_node("shieldScroll/shield").get_button_text(button_idx)):
			get_node("/root/global").selectedShield = button_idx
			newPopUp = buyItemPopUp.instance()
			self.add_child(newPopUp)
			newPopUp.show()
			#set pop up text
			newPopUp.set_text("Buy" + " " + get_node("/root/global").SHIELDS[get_node("/root/global").selectedShield][3] + " for "+ str(get_node("/root/global").SHIELDS[get_node("/root/global").selectedShield][2]) + " gold?" + 
			"\nLevel: " + str(get_node("/root/global").SHIELDS[get_node("/root/global").selectedShield][1]))
			
			helms = false
			weapons = false
			shields = true
			
			newPopUp.connect("confirmed", self, "buy_It_Accepted")
